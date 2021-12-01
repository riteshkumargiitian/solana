#!/usr/bin/env bash
#
# Exports a subdirectory into another github repository
#

set -e
if [[ -z $GITHUB_TOKEN ]]; then
  echo GITHUB_TOKEN not defined
  exit 1
fi

cd "$(dirname "$0")/.."

pip3 install git-filter-repo

declare subdir=$1
echo "$1"
declare repo_name=$2
echo "$2"
# declare origin=$3

[[ -n "$subdir" ]] || {
  echo "Error: subdir not specified"
  exit 1
}
[[ -n "$repo_name" ]] || {
  echo "Error: repo_name not specified"
  exit 1
}

echo "Exporting $subdir"

set -x

# rm -rf .github_export/"$repo_name"
# git clone https://"$GITHUB_TOKEN"@github.com/Naveenmishra1197/"$repo_name" .github_export/"$repo_name"
# git filter-repo --subdirectory-filter "$subdir" --target .github_export/"$repo_name"
# # # git remote add origin https://github.com/Naveenmishra1197/solana-web3.js.git
# # # git pull https://"$GITHUB_TOKEN"@github.com/Naveenmishra1197/"$repo_name" --allow-unrelated-histories
# # git pull --rebase https://"$GITHUB_TOKEN"@github.com/Naveenmishra1197/"$repo_name" --allow-unrelated-histories
# # git fetch 
# # git merge --allow-unrelated-histories
# # git branch --set-upstream-to origin/master
# # git add export-github-repo.sh
# # git rebase --continue
# # # git merge
# git pull
# git -C .github_export/"$repo_name" push  https://"$GITHUB_TOKEN"@github.com/Naveenmishra1197/"$repo_name"


rm -rf .github_export/"$repo_name"
git clone https://"$GITHUB_TOKEN"@github.com/Naveenmishra1197/"$repo_name" .github_export/"$repo_name"
git filter-repo --to-subdirectory-filter "$subdir" --target .github_export/"$repo_name"
git -C .github_export/"$repo_name" push  https://"$GITHUB_TOKEN"@github.com/Naveenmishra1197/"$repo_name"
 

#  rm -rf .github_export/"$repo_name"
#  git clone https://github.com/Naveenmishra1197/solana.git .github_export/"$repo_name"
#  cd .github_export/"$repo_name"
#  git filter-branch --subdirectory-filter "$subdir" -- --all
#  git remote rm origin
#  git config --global user.email "naveenmishra1197@gmail.com"
#  git config --global user.name "Naveenmishra1197"
#  git remote add origin https://"$GITHUB_TOKEN"@github.com/Naveenmishra1197/solana-web3.js.git
#  git config pull.rebase false
#  git pull origin master --allow-unrelated-histories
#  git push --set-upstream origin master
# #  git push https://"$GITHUB_TOKEN"@github.com/Naveenmishra1197/"$origin"

