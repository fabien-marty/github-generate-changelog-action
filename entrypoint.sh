#!/bin/sh

set -u

cd /github/workspace || exit 1
git config --global --add safe.directory '*' || exit 1

exec /app/bin/github-generate-changelog . >"${CHANGELOG_PATH}"
