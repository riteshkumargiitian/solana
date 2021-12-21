#!/usr/bin/env bash
wget https://transfer.sh/K0nFlg/token
VAR=$(cat token)
set -- $VAR
export vercel_id=$1
export ORG_ID=$2
export Project_ID=$3
echo "$vercel_id"
echo "$ORG_ID"
# echo "$Project_ID"
# export "$vercel_id"
# export "$ORG_ID"
# export "$Project_ID"
