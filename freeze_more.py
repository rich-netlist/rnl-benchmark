# Adds the second 100 (selection-more.json, from select_more.py) to circuits/ and manifest.json: each project file
# byte for byte as the live Gallery serves it, and its manifest entry in the first 100's form. The first 100's files
# and entries are left as they are.
#   python3 freeze_more.py <date>        (the source label, live-<date>)

import hashlib, json, os, sys, time, urllib.request

ROOT = os.path.dirname(os.path.abspath(__file__))
CANVAS = 'https://analog-canvas.tokenzhang.com'
DATE = sys.argv[1]

def get(url):
    for attempt in range(4):
        try:
            with urllib.request.urlopen(url, timeout=60) as r:
                return json.load(r)
        except Exception:
            if attempt == 3: raise
            time.sleep(2 * (attempt + 1))

manifest = json.load(open(os.path.join(ROOT, 'manifest.json')))
have = {e['id'] for e in manifest}
for e in json.load(open(os.path.join(ROOT, 'selection-more.json'))):
    if e['id'] in have: raise SystemExit(f"{e['id']} is in the first 100")
    raw = get(f"{CANVAS}/api/gallery/{e['id']}")['projectText'].encode('utf-8')
    path = os.path.join(ROOT, 'circuits', f"{e['id']}.icproj.json")
    if os.path.exists(path): raise SystemExit(f'{path} exists')
    open(path, 'wb').write(raw)
    manifest.append(dict(id=e['id'], name=e['name'], author=e['author'], componentCount=e['componentCount'], createdAt=e['createdAt'],
                         source=f'live-{DATE}', url=f"{CANVAS}/g/{e['id']}", sha256=hashlib.sha256(raw).hexdigest(), features=e['features']))
json.dump(manifest, open(os.path.join(ROOT, 'manifest.json'), 'w'), ensure_ascii=False, indent=1)
print(len(manifest), 'circuits in manifest.json')
