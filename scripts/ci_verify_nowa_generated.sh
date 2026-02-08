#!/usr/bin/env bash
# scripts/ci_verify_nowa_generated.sh
# CI script to fail a PR if it removes any @NowaGenerated() annotations that existed on the base branch.
# This script expects two args: base_ref and head_ref (both git refs accessible in CI). In GitHub Actions, use ${{ github.event.pull_request.base.sha }} and ${{ github.event.pull_request.head.sha }}.

set -euo pipefail

if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <base_ref> <head_ref>" >&2
  exit 1
fi
BASE_REF=$1
HEAD_REF=$2

# Find files that contained the token in base
FILES_WITH_TOKEN=$(git grep -l "@NowaGenerated" "$BASE_REF" || true)
if [ -z "$FILES_WITH_TOKEN" ]; then
  echo "No files with @NowaGenerated in base ref ($BASE_REF). Nothing to check." >&2
  exit 0
fi

FAIL=0
for f in $FILES_WITH_TOKEN; do
  # Get file contents at base and head refs
  git show "$BASE_REF":"$f" >/dev/null 2>&1 || continue
  git show "$HEAD_REF":"$f" >/dev/null 2>&1 || {
    echo "ERROR: File $f existed with @NowaGenerated in base ref but is missing in head ref." >&2
    FAIL=1
    continue
  }
  if ! git show "$HEAD_REF":"$f" | grep -q "@NowaGenerated"; then
    echo "ERROR: @NowaGenerated removed from file: $f" >&2
    FAIL=1
  fi
done

if [ "$FAIL" -ne 0 ]; then
  echo "One or more Nowa-generated annotations were removed in this PR. Failing CI." >&2
  exit 2
fi

echo "OK: Nowa-generated annotations preserved." >&2
exit 0

