#!/usr/bin/env python3
# scripts/check_pr_nowa_title.py
# Checks whether a PR that touches files containing @NowaGenerated has a title including [nowa-generated].
# If not, posts a comment on the PR (warn-only).

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

    if not (GITHUB_TOKEN and GITHUB_REPOSITORY and PR_NUMBER and BASE_SHA and HEAD_SHA):
        print('Missing required environment variables. Exiting.', file=sys.stderr)
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

    # Post a friendly comment to the PR
    body = (
        "Heads-up: this PR modifies Nowa-generated files but the PR title does not include '[nowa-generated]'.\n\n"
        "Please update the PR title to include '[nowa-generated]' and confirm whether these are generated changes or non-invasive wrappers. "
        "Maintainers require this tag to review generated-code changes safely.\n\n"
        "Files detected (examples):\n" + '\n'.join(f'- {p}' for p in generated_files[:10]) + '\n\n'
        "If you intentionally changed generated code, add '[nowa-generated]' to the title and request a Nowa-owner review."
    )

    ok = post_comment(GITHUB_REPOSITORY, PR_NUMBER, GITHUB_TOKEN, body)
    if ok:
        print('Posted reminder comment to PR.')
    else:
        print('Failed to post comment.')

    # Warn-only: do not fail the workflow
    sys.exit(0)

if __name__ == '__main__':
    main()

