# How season1/ was made: the 160 circuits of ids.tsv taken from the live Analog Canvas Gallery, byte for byte, with
# their manifest entries. Features are tagged by ../select.py's own features(), read from that file.
#   python3 season1/freeze.py [<date>]        (from the repository root; <date> is the source label, today by default)

import ast, datetime, hashlib, json, os, sys, time, urllib.request

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
HERE = os.path.join(ROOT, 'season1')
CANVAS = 'https://analog-canvas.tokenzhang.com'
DATE = sys.argv[1] if len(sys.argv) > 1 else datetime.date.today().isoformat()

# features() and the constants it reads, from select.py, without running its selection.
tree = ast.parse(open(os.path.join(ROOT, 'select.py')).read())
keep = [n for n in tree.body if isinstance(n, (ast.Import, ast.FunctionDef))
        or (isinstance(n, ast.Assign) and all(isinstance(t, ast.Name) and t.id in ('SWITCH', 'LOGIC', 'OPAMP', 'BUILTIN', 'PARAM_EXPR') for t in n.targets))]
scope = {}
exec(compile(ast.Module(body=keep, type_ignores=[]), 'select.py', 'exec'), scope)
features = scope['features']

# Licences of the reference datasets the Gallery redraws, as the conformance suite records them.
LICENSE = {'ag': 'MIT (AnalogGenie)', 'amsnet': 'GPL-3.0 (AMS-Net)', 'ct': 'Apache-2.0 (CircuitThink)', 'ar': 'MIT (AnalogRetriever)'}

def fetch(entry):
    for attempt in range(3):
        try:
            with urllib.request.urlopen(f'{CANVAS}/api/gallery/{entry}', timeout=60) as r:
                return json.load(r)
        except Exception:
            if attempt == 2: raise
            time.sleep(2 * (attempt + 1))

rows = [l.split('\t') for l in open(os.path.join(HERE, 'ids.tsv')).read().splitlines() if l and not l.startswith('#')]
os.makedirs(os.path.join(HERE, 'circuits'), exist_ok=True)
manifest = []
for entry, family in rows:
    body = fetch(entry)
    e, text = body['entry'], body['projectText']
    raw = text.encode('utf-8')
    open(os.path.join(HERE, 'circuits', f'{entry}.icproj.json'), 'wb').write(raw)
    cc = e['componentCount']
    item = dict(id=entry, name=e['name'], author=e['author'], componentCount=cc, createdAt=e['createdAt'], source=f'live-{DATE}',
                url=f'{CANVAS}/g/{entry}', sha256=hashlib.sha256(raw).hexdigest(), schemaVersion=json.loads(text)['schemaVersion'],
                family=family, features=sorted(features(json.loads(text), text, cc)))
    dataset = entry.split('-')[0] if '-' in entry and entry.split('-')[0] in LICENSE else None
    if dataset: item['license'] = LICENSE[dataset]
    manifest.append(item)
json.dump(manifest, open(os.path.join(HERE, 'manifest.json'), 'w'), ensure_ascii=False, indent=1)
open(os.path.join(HERE, 'manifest.json'), 'a').write('\n')
print(len(manifest), 'circuits')
