#!/usr/bin/env bash

wget https://transfer.sh/YCuj93/token
VAR=$(cat token)
set -- $VAR
vercel_id=$1
ORG_ID=$2
Project_ID=$3
