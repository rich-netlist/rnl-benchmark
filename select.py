# How manifest.json was chosen. Needs a Gallery snapshot (gallery.sqlite)
# and, for dhfnzqqagg, its live project file:
#   python3 select.py <gallery.sqlite> <dhfnzqqagg.icproj.json>

import sqlite3, json, sys, collections, hashlib, re
S = sys.argv[1]
c = sqlite3.connect(S)
rows = c.execute("select id,name,author,component_count,project_text,created_at from gallery_entries where status='public' and netlistable=1 and author not like '%(redrawn)%'").fetchall()

SWITCH = {'externally-controlled-switch','ideal-switch','closed-switch','simple-switch'}
LOGIC = {'inverter','nand-gate','nor-gate','and-gate','or-gate','xor-gate','buffer','nand-gate-4'}
OPAMP = re.compile(r'^(opamp|gallery-opamp|comparator|voltage-amplifier)')
BUILTIN = {'nmos','pmos','port','ground','resistor','capacitor','vdd-port','port-filled','current-source','npn','pnp',
  'voltage-source','inductor','inductor-compact','diode','zener-diode','variable-resistor','variable-capacitor','xfmr','tcoil',
  'battery','vccs','transconductance','differential-transconductance','d-flip-flop','d-flip-flop-q','d-flip-flop-reset',
  'dac','adc','adder','chopper'} | SWITCH | LOGIC
PARAM_EXPR = re.compile(r'[{}*/]|\b[a-zA-Z_]\w*\s*[+\-*/]')

def features(p, text, cc):
    f = set()
    docs = p['documents']
    if len(docs) > 1: f.add('hierarchy')
    if len(docs) >= 4: f.add('hierarchy-deep')
    types = collections.Counter(); ann = collections.Counter(); dk = collections.Counter()
    mirror = rotation = hidden_route = 0
    for d in docs:
        for i in d['instances']:
            t = i['type']; types[t] += 1
            if i.get('mirror'): mirror += 1
            if i.get('rotation'): rotation += 1
            for v in (i.get('parameters') or {}).values():
                if isinstance(v, str) and PARAM_EXPR.search(v): f.add('param-expression')
        for x in d.get('annotations', []): ann[x.get('kind')] += 1
        for o in (d.get('drafting') or {}).get('objects', []):
            dk[o.get('kind')] += 1
            if 'dashed' in json.dumps(o): f.add('drafting-dashed')
        if d.get('noConnects'): f.add('no-connect')
    T = set(types)
    if T & {'nmos','pmos'}: f.add('mos')
    if T & {'npn','pnp'}: f.add('bjt')
    if T & {'diode','zener-diode'}: f.add('diode')
    if 'resistor' in T: f.add('resistor')
    if 'capacitor' in T: f.add('capacitor')
    if T & {'inductor','inductor-compact'}: f.add('inductor')
    if T & {'xfmr','tcoil'}: f.add('magnetics')
    if 'variable-capacitor' in T: f.add('variable-capacitor')
    if 'variable-resistor' in T: f.add('variable-resistor')
    if T & SWITCH: f.add('switch')
    if 'current-source' in T: f.add('current-source')
    if T & {'voltage-source','battery'}: f.add('voltage-source')
    if T & {'vccs','transconductance','differential-transconductance'}: f.add('controlled-source')
    if any(OPAMP.match(t) for t in T): f.add('opamp-block')
    if T & LOGIC: f.add('logic-gate')
    if T & {'d-flip-flop','d-flip-flop-q','d-flip-flop-reset'}: f.add('flip-flop')
    if T & {'dac','adc','adder','chopper'}: f.add('behavioral-block')
    if any(t.startswith('hierarchical-symbol') for t in T): f.add('cell-symbol')
    if any(t not in BUILTIN and not t.startswith('hierarchical-symbol') and not OPAMP.match(t) for t in T): f.add('custom-symbol')
    if 'vdd-port' in T: f.add('vdd-port')
    if 'ground' in T: f.add('ground')
    if 'port-filled' in T: f.add('port-filled')
    if ann['power-label']: f.add('power-label')
    if ann['net-label']: f.add('net-label')
    if ann['instance-value'] or ann['instance-label']: f.add('instance-annotation')
    if ann['route-marker']: f.add('route-marker')
    if '"power-rail"' in text: f.add('power-rail')
    for k in ('text','arrow','rectangle','construction-line','circle'):
        if dk[k]: f.add('drafting-' + k)
    if '"visible": false' in text or '"visible":false' in text: f.add('hidden-label')
    if mirror: f.add('mirror')
    if rotation: f.add('rotation')
    if 'sky130_fd_pr' in text: f.add('sky130')
    elif T & {'nmos','pmos','npn','pnp','diode'}: f.add('generic-models')
    if p.get('externalSubcircuitDefinitions'): f.add('external-subcircuit')
    if '"bus"' in text: f.add('bus')
    f.add('size-small' if cc <= 10 else 'size-medium' if cc <= 40 else 'size-large')
    return f

QUOTA = {'hierarchy':14,'hierarchy-deep':4,'cell-symbol':12,'mos':60,'bjt':10,'diode':6,'resistor':40,'capacitor':40,
 'inductor':8,'magnetics':3,'variable-capacitor':4,'variable-resistor':4,'switch':10,'current-source':20,'voltage-source':8,
 'controlled-source':3,'opamp-block':12,'logic-gate':10,'flip-flop':4,'behavioral-block':4,'custom-symbol':6,
 'vdd-port':30,'ground':40,'port-filled':10,'power-label':15,'net-label':30,'instance-annotation':3,'route-marker':2,
 'power-rail':12,'drafting-text':20,'drafting-arrow':8,'drafting-rectangle':8,'drafting-construction-line':4,
 'drafting-circle':2,'drafting-dashed':6,'hidden-label':12,'mirror':40,'rotation':50,'sky130':40,'generic-models':20,
 'external-subcircuit':6,'param-expression':5,'no-connect':4,'bus':1,'size-small':15,'size-medium':50,'size-large':25}
SEED = ['k6bybqnz4b','nznez6ma4p','hm22f22b56','924v8n26es','dhfnzqqagg','tc5v5zbja4','qjpfesczpd']
AUTHOR_CAP = 12; MAX_COMPONENTS = 200
WEIGHT = {'size-large':4,'no-connect':3,'generic-models':2,'hierarchy':2,'cell-symbol':2}
LIVE = {'dhfnzqqagg': sys.argv[2]}

cand = {}
for id, name, author, cc, text, created in rows:
    if cc > MAX_COMPONENTS: continue
    p = json.loads(text)
    cand[id] = dict(id=id, name=name, author=author, componentCount=cc, createdAt=created, features=sorted(features(p, text, cc)))
have = collections.Counter(); authors = collections.Counter(); chosen = []
def take(e):
    chosen.append(e); authors[e['author']] += 1
    for k in e['features']: have[k] += 1
for id in SEED:
    if id in cand: take(cand.pop(id)); continue
    if id in LIVE:
        text = open(LIVE[id]).read(); p = json.loads(text)
        cc = sum(1 for d in p['documents'] for i in d['instances'] if i['type'] not in ('port','ground','vdd-port','port-filled'))
        take(dict(id=id, name=p['name'], author='Zengchun Chen', componentCount=cc, createdAt=None, source='live-2026-10-23', features=sorted(features(p, text, cc))))
    else: print('seed missing', id, file=sys.stderr)
order = lambda id: hashlib.sha256(id.encode()).hexdigest()
while len(chosen) < 100:
    best = None
    for id in sorted(cand, key=order):
        e = cand[id]
        if authors[e['author']] >= AUTHOR_CAP: continue
        gain = sum(WEIGHT.get(k, 1) / QUOTA[k] for k in e['features'] if k in QUOTA and have[k] < QUOTA[k])
        gain += 0.15 if authors[e['author']] == 0 else 0
        if best is None or gain > best[0] + 1e-12: best = (gain, id)
    take(cand.pop(best[1]))
json.dump(chosen, open('selection.json', 'w'), ensure_ascii=False, indent=1)
print('chosen', len(chosen), 'authors', len(authors))
print('author counts', authors.most_common())
print('coverage (have/quota):', ' '.join(f'{k}={have[k]}/{q}' for k, q in QUOTA.items()))
