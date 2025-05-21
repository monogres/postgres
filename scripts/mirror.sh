#!/bin/bash

set -euo pipefail

UPSTREAM_URL="${UPSTREAM_URL-https://git.postgresql.org/git/postgresql.git}"
MIRROR_URL="${MIRROR_URL-https://$AUTH_TOKEN@github.com/monogres/postgres}"
CONFLICTING_NAMES="monogres"

echo -n "Check upstream for references that conflict with '$CONFLICTING_NAMES'... "

conflicts="$(git ls-remote "$UPSTREAM_URL" | grep -i "$CONFLICTING_NAMES" || true)"

if [[ -n "$conflicts" ]]; then
    echo "FOUND"
    echo "$conflicts" | head
    echo "Exiting..."
    exit 1
fi
echo "NONE"

echo "Add remote upstream"
if ! git remote -v | grep -q "^upstream\t"; then
    git remote add --mirror=fetch upstream "$UPSTREAM_URL"
fi

echo "Fetch upstream"
git fetch upstream --quiet

echo "Push to mirror"
git push --force --mirror --prune origin
