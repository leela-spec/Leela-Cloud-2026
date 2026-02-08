#!/usr/bin/env python3
# scripts/check_pr_nowa_title.py
# Checks whether a PR that touches files containing @NowaGenerated has a title including [nowa-generated].
# If not, posts a comment on the PR and exits non-zero to fail the job (strict enforcement).

import os
import sys
import subprocess
import json
from urllib import request, parse


def run_git_diff(base, head):
    try:
        out = subprocess.check_output(['git', 'diff', '--name-only', base, head])
        return out.decode('utf-8', errors='ignore').splitlines()
    except subprocess.CalledProcessError:
        return []


def file_contains_token(path, token='@NowaGenerated'):
    try:
        with open(path, 'r', encoding='utf-8') as f:
            data = f.read()
            return token in data
    except Exception:
        return False


def post_comment(repo, pr_number, token, body):
    url = f'https://api.github.com/repos/{repo}/issues/{pr_number}/comments'
    data = json.dumps({'body': body}).encode('utf-8')
    req = request.Request(url, data=data, method='POST')
    req.add_header('Content-Type', 'application/json')
    req.add_header('Accept', 'application/vnd.github+json')
    req.add_header('User-Agent', 'nowa-pr-checker')
    req.add_header('Authorization', f'token {token}')
    try:
        with request.urlopen(req) as resp:
            return resp.status == 201
    except Exception as e:
        print('Failed to post comment:', e, file=sys.stderr)
        return False


def main():
    GITHUB_TOKEN = os.environ.get('GITHUB_TOKEN')
    GITHUB_REPOSITORY = os.environ.get('GITHUB_REPOSITORY')
    PR_NUMBER = os.environ.get('PR_NUMBER')
    BASE_SHA = os.environ.get('BASE_SHA')
    HEAD_SHA = os.environ.get('HEAD_SHA')
    PR_TITLE = os.environ.get('PR_TITLE', '')

    if not (GITHUB_REPOSITORY and PR_NUMBER and BASE_SHA and HEAD_SHA):
        print('Missing required environment variables for full enforcement. Exiting with success to avoid false failure.', file=sys.stderr)
        # If running locally without full CI env, don't fail the job
        sys.exit(0)

    changed_files = run_git_diff(BASE_SHA, HEAD_SHA)
    if not changed_files:
        print('No changed files found between refs. Nothing to do.')
        sys.exit(0)

    generated_files = []
    for f in changed_files:
        # Skip binary or deleted files
        if not os.path.isfile(f):
            continue
        if file_contains_token(f):
            generated_files.append(f)

    if not generated_files:
        print('No Nowa-generated files changed in this PR.')
        sys.exit(0)

    # Check PR title for tag
    if '[nowa-generated]' in PR_TITLE.lower():
        print('PR title includes [nowa-generated]. OK.')
        sys.exit(0)

    # Build suggested title
    suggested_title = f"[nowa-generated] {PR_TITLE}" if PR_TITLE.strip() else '[nowa-generated] <short description>'

    # Post a friendly comment to the PR (and then fail CI)
    files_list = '\n'.join(f'- {p}' for p in generated_files[:20])
    body = (
        "⚠️ Nowa-generated files detected without PR tag\n\n"
        "This PR modifies files that contain `@NowaGenerated()` but the PR title does not include the required tag `[nowa-generated]`. "
        "Per repository policy, changes to generated code must be reviewed by a Nowa-owner.\n\n"
        "Suggested PR title:\n``\n" + suggested_title + "\n``\n\n"
        "Files detected (examples):\n" + files_list + "\n\n"
        "Please update the PR title to include `[nowa-generated]` and request a Nowa-owner review. "
        "If these changes are only non-invasive wrappers or tests, note that in the PR description."
    )

    if GITHUB_TOKEN:
        ok = post_comment(GITHUB_REPOSITORY, PR_NUMBER, GITHUB_TOKEN, body)
        if ok:
            print('Posted reminder comment to PR.')
        else:
            print('Failed to post comment to PR; failing job to be safe.', file=sys.stderr)
            sys.exit(2)
    else:
        # No token -> print instructions and fail to enforce policy in CI environments only.
        print('No GITHUB_TOKEN available to post comment. Please update PR title to include [nowa-generated].', file=sys.stderr)
        print('Suggested title:', suggested_title, file=sys.stderr)

    # Fail the job so the PR author must update the title (strict enforcement)
    print('Failing CI: PR modifies Nowa-generated files but lacks [nowa-generated] tag.', file=sys.stderr)
    sys.exit(2)

if __name__ == '__main__':
    main()

