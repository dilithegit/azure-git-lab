#!/bin/bash
# push.sh - stage, commit and push all changes in this repo
# Usage: ./push.sh "commit message"

set -e
cd "$(dirname "$0")"

MSG="${1:-Auto update $(date '+%Y-%m-%d %H:%M:%S')}"

if [ -z "$(git status --porcelain)" ]; then
    echo "Nothing to commit. Working tree clean."
    exit 0
fi

git add -A
git commit -m "$MSG"
git push origin main
echo "Pushed at $(date) with message: $MSG"
