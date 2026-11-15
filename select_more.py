# How the second 100 of manifest.json were chosen (2026-11-15): from the live Analog Canvas Gallery, beside the first
# 100, by the rules of select.py: public circuits whose netlist Canvas can write, the community's and the reference
# datasets' redrawn in Canvas (AnalogGenie, AnalogRetriever, Image2Net, AMS-Net, CircuitThink) alike, at most 200 parts,
# at most 12 per author and 25 per dataset across all 200, picked greedily to fill feature quotas, ties broken by a
# hash of the id. The quotas are for the 200 together (twice select.py's), counted from the first 100 on, with
# more weight on what the first 100 lack (buses, no-connect marks, generic models, deep hierarchy, large circuits).
# A circuit of Schematic Arena's Season 1 board (season1/ids.tsv) gets a small bonus, never a place by itself.
# Left out: drawings of fewer than 3 parts, placeholder or coursework names ("New Circuit", "Arena drawing", "HW",
# "task_1"), an "(AI)" copy of a circuit that is there without it, and a second drawing of a circuit already in the
# 200 by name (spelling, case, spaces and an "(AI)" mark aside).
#   python3 select_more.py <cache dir>        (writes selection-more.json; the cache keeps each circuit's features)

import ast, collections, re, concurrent.futures, hashlib, json, os, sys, time, urllib.parse, urllib.request

ROOT = os.path.dirname(os.path.abspath(__file__))
CANVAS = 'https://analog-canvas.tokenzhang.com'
CACHE = sys.argv[1]
os.makedirs(CACHE, exist_ok=True)

# select.py's features(), constants and QUOTA, without running its selection.
tree = ast.parse(open(os.path.join(ROOT, 'select.py')).read())
names = ('SWITCH', 'LOGIC', 'OPAMP', 'BUILTIN', 'PARAM_EXPR', 'QUOTA', 'WEIGHT', 'AUTHOR_CAP', 'MAX_COMPONENTS')
keep = [n for n in tree.body if isinstance(n, (ast.Import, ast.FunctionDef))
        or (isinstance(n, ast.Assign) and all(isinstance(t, (ast.Name, ast.Tuple)) for t in n.targets)
            and any(isinstance(t, ast.Name) and t.id in names or isinstance(t, ast.Tuple) and any(e.id in names for e in t.elts) for t in n.targets))]
scope = {}
exec(compile(ast.Module(body=keep, type_ignores=[]), 'select.py', 'exec'), scope)
features, QUOTA, AUTHOR_CAP, MAX_COMPONENTS = scope['features'], scope['QUOTA'], scope['AUTHOR_CAP'], scope['MAX_COMPONENTS']

def get(url):
    for attempt in range(4):
        try:
            with urllib.request.urlopen(url, timeout=60) as r:
                return json.load(r)
        except Exception:
            if attempt == 3: raise
            time.sleep(2 * (attempt + 1))

# Every circuit whose netlist Canvas can write: the community's (by hand and AI-made) and each reference dataset's.
listed = []
for filt in ({'ai': '0'}, {'ai': '1'}, *({'source': s} for s in ('analoggenie', 'analogretriever', 'image2net', 'amsnet', 'circuitthink'))):
    cursor = None
    while True:
        q = {'limit': '200', **filt, 'netlistable': '1', **({'cursor': cursor} if cursor else {})}
        page = get(f'{CANVAS}/api/gallery?{urllib.parse.urlencode(q)}')
        listed += page['entries']
        cursor = page.get('nextCursor')
        if not cursor: break
listed = list({e['id']: e for e in listed}.values())

def tagged(entry):
    path = os.path.join(CACHE, f"{entry['id']}.json")
    if not os.path.exists(path):
        text = get(f"{CANVAS}/api/gallery/{entry['id']}")['projectText']
        json.dump(sorted(features(json.loads(text), text, entry['componentCount'])), open(path, 'w'))
    return entry['id'], json.load(open(path))

first = json.load(open(os.path.join(ROOT, 'manifest.json')))
first_ids = {e['id'] for e in first}
board = {l.split('\t')[0] for l in open(os.path.join(ROOT, 'season1', 'ids.tsv')) if l.strip() and not l.startswith('#')}
pool = [e for e in listed if e['id'] not in first_ids and e['componentCount'] <= MAX_COMPONENTS]
with concurrent.futures.ThreadPoolExecutor(8) as ex:
    tags = dict(ex.map(tagged, pool))

PLACEHOLDER = re.compile(r'^(new circuit|untitled|arena drawing)|\bhw\b|homework|task_?\d', re.I)
def key(name):
    name = re.sub(r'\(ai\)', '', name.lower())
    return re.sub(r'(.)\1+', r'\1', re.sub(r'[^a-z0-9]', '', name))
pool = [e for e in pool if e['componentCount'] >= 3 and not PLACEHOLDER.search(e['name'].strip())]
plain = {key(e['name']) for e in pool if '(ai)' not in e['name'].lower()}
pool = [e for e in pool if not ('(ai)' in e['name'].lower() and key(e['name']) in plain)]   # an "(AI)" copy gives way
cand = {e['id']: dict(id=e['id'], name=e['name'], author=e['author'], componentCount=e['componentCount'], createdAt=e['createdAt'],
                      features=tags[e['id']]) for e in pool}

QUOTA2 = {k: 2 * q for k, q in QUOTA.items()} | {'bus': 6, 'no-connect': 10, 'generic-models': 40, 'hierarchy-deep': 10}
WEIGHT2 = {'size-large': 4, 'no-connect': 3, 'generic-models': 3, 'hierarchy': 2, 'hierarchy-deep': 2, 'cell-symbol': 2, 'bus': 4}
have = collections.Counter(k for e in first for k in e['features'])
authors = collections.Counter(e['author'] for e in first)
order = lambda id: hashlib.sha256(id.encode()).hexdigest()
chosen = []
names = {key(e['name']) for e in first}
while len(chosen) < 100:
    best = None
    for id in sorted(cand, key=order):
        e = cand[id]
        if authors[e['author']] >= (25 if '(redrawn)' in e['author'] else AUTHOR_CAP): continue
        if key(e['name']) in names: continue
        gain = sum(WEIGHT2.get(k, 1) / QUOTA2[k] for k in e['features'] if k in QUOTA2 and have[k] < QUOTA2[k])
        gain += 0.15 if authors[e['author']] == 0 else 0
        gain += 0.1 if id in board else 0
        if best is None or gain > best[0] + 1e-12: best = (gain, id)
    e = cand.pop(best[1]); chosen.append(e); authors[e['author']] += 1; names.add(key(e['name']))
    for k in e['features']: have[k] += 1
json.dump(chosen, open(os.path.join(ROOT, 'selection-more.json'), 'w'), ensure_ascii=False, indent=1)
print('pool', len(pool), 'chosen', len(chosen), 'authors', len({e['author'] for e in chosen}), 'from the board', sum(e['id'] in board for e in chosen))
print('by author', collections.Counter(e['author'] for e in chosen).most_common())
print('coverage of the 200 (have/quota):', ' '.join(f'{k}={have[k]}/{q}' for k, q in QUOTA2.items()))
