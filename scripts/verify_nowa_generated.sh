#!/usr/bin/env bash
# scripts/verify_nowa_generated.sh
# Exit non-zero if any staged change removes an @NowaGenerated() annotation that existed on base branch.
# Usage: run from repo root.

set -euo pipefail

# Get list of staged files
STAGED_FILES=$(git diff --name-only --cached || true)
if [ -z "$STAGED_FILES" ]; then
  echo "No staged files to check." >&2
  exit 0
fi

# For each staged file, check if it removed any @NowaGenerated token compared to HEAD
FAIL=0
for f in $STAGED_FILES; do
  # Only check text files that exist either in HEAD or index
  if git show :"$f" >/dev/null 2>&1 || git show HEAD:"$f" >/dev/null 2>&1; then
    # Show diff of staged changes for file
    DIFF=$(git diff --cached -U0 -- "$f" || true)
    if [ -n "$DIFF" ]; then
      # Look for removed lines that contain @NowaGenerated
      if echo "$DIFF" | grep -E "^\-.*@NowaGenerated\(" >/dev/null 2>&1; then
        echo "ERROR: Staged change removes @NowaGenerated annotation in file: $f" >&2
        FAIL=1
      fi
      # Also catch removals of the exact token without parenthesis
      if echo "$DIFF" | grep -E "^\-.*@NowaGenerated\b" >/dev/null 2>&1; then
        echo "ERROR: Staged change removes @NowaGenerated token in file: $f" >&2
        FAIL=1
      fi
    fi
  fi
done

if [ "$FAIL" -ne 0 ]; then
  echo "One or more staged changes remove Nowa-generated annotations. Aborting commit." >&2
  exit 2
fi

exit 0

