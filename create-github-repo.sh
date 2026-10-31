#!/bin/sh
# SPDX-License-Identifier: MIT
# Create GitHub repo via API, then push
# Reads token from ~/github_token

set -eu

REPO_DIR="/home/petark/2027-repo"
GH_USER="peterkokosharov"
GH_REPO="2027-book"
TOKEN_FILE="$HOME/github_token"

cd "$REPO_DIR"

# Read token
if [ ! -f "$TOKEN_FILE" ] || [ ! -r "$TOKEN_FILE" ]; then
    echo "Token file not found: $TOKEN_FILE" >&2
    exit 1
fi
GH_TOKEN="$(cat "$TOKEN_FILE" | tr -d '[:space:]')"
[ -n "$GH_TOKEN" ] || { echo "Empty token" >&2; exit 1; }

# Create repo via GitHub API
echo "Creating repository $GH_USER/$GH_REPO ..."
RESPONSE=$(curl -s -w "\n%{http_code}" \
  -H "Authorization: token $GH_TOKEN" \
  -H "Accept: application/vnd.github.v3+json" \
  -d "{\"name\":\"$GH_REPO\",\"private\":false,\"has_issues\":true,\"has_wiki\":false}" \
  "https://api.github.com/user/repos")

HTTP_CODE=$(echo "$RESPONSE" | tail -n1)
BODY=$(echo "$RESPONSE" | head -n-1)

if [ "$HTTP_CODE" = "201" ]; then
    echo "Repository created successfully."
elif [ "$HTTP_CODE" = "422" ] && echo "$BODY" | grep -q "already exists"; then
    echo "Repository already exists, continuing..."
else
    echo "Failed to create repo (HTTP $HTTP_CODE):" >&2
    echo "$BODY" >&2
    exit 1
fi

# Add remote and push
git remote remove origin 2>/dev/null || true
git remote add origin "https://${GH_USER}:${GH_TOKEN}@github.com/${GH_USER}/${GH_REPO}.git"
git branch -M main
git push -u origin main

echo "Done. Repo: https://github.com/${GH_USER}/${GH_REPO}"