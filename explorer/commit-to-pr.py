#\\!/usr/bin/env python3

import json
import urllib.request
import sys

try:
    with urllib.request.urlopen("https://api.github.com/search/issues?q=sha:" + sys.argv[1]) as resp:
        data = json.loads(resp.read().decode())
        prs = [{'number': pr['number'], 'url': pr['html_url']} for pr in data["items"]]
        if len(prs) == 0:
            print("No matching PR", file=sys.stderr)
            sys.exit(1)
        for pr in prs:
            print("PR #{}: {}".format(pr['number'], pr['url']))

    sys.exit(0)
except Exception as e:
    print(e, file=sys.stderr)
    sys.exit(1)
