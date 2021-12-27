#!/usr/bin/env bash

set -ex
# pwd
# source ./token.sh
if [[ -d .vercel ]]; then
  rm -r .vercel
fi

CONFIG_FILE=vercel.json
PROJECT_NAME=solana
vercel_id="Jac34Sds5t0RgFgpTpRcicD7"
echo "$vercel_id"
cat > "$CONFIG_FILE" <<EOF
{
  "name": "$PROJECT_NAME",
  "scope": "avnshrai"
}
EOF

[[ -n $vercel_id ]] || {
  echo "VERCEL_TOKEN is undefined.  Needed for Vercel authentication."
  exit 1
}
vercel deploy . --local-config="$CONFIG_FILE" --confirm --token "$vercel_id"
