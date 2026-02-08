#!/usr/bin/env python3
# scripts/ci_verify_nowa_blocks.py
# Usage: scripts/ci_verify_nowa_blocks.py <base_ref> <head_ref>
# Fails (exit != 0) if any Nowa-generated block content changed between base and head.

import sys
import subprocess
import re
import difflib


def git_show(ref, path):
    try:
        out = subprocess.check_output(['git', 'show', f'{ref}:{path}'], stderr=subprocess.DEVNULL)
        return out.decode('utf-8', errors='ignore')
    except subprocess.CalledProcessError:
        return None


def files_with_token(ref):
    try:
        out = subprocess.check_output(['git', 'grep', '-l', r'@NowaGenerated', ref], stderr=subprocess.DEVNULL)
        files = out.decode('utf-8', errors='ignore').strip().splitlines()
        return [f for f in files if f]
    except subprocess.CalledProcessError:
        return []


def extract_generated_blocks(text):
    # Find occurrences of @NowaGenerated and capture the next class { ... } block.
    blocks = []
    if text is None:
        return blocks
    # Normalize line endings
    lines = text.splitlines()
    for i, line in enumerate(lines):
        if '@NowaGenerated' in line:
            # search forwards for 'class ' declaration
            for j in range(i, min(i+20, len(lines))):
                if re.search(r'^\s*class\s+\w+', lines[j]):
                    # find opening brace for class
                    # join lines from j onwards and find first '{' index, then do brace balancing
                    joined = "\n".join(lines[j:])
                    brace_idx = joined.find('{')
                    if brace_idx == -1:
                        # no brace found, fallback: collect until blank line
                        snippet = "\n".join(lines[j:j+50])
                        blocks.append(snippet.strip())
                        break
                    # now walk char-by-char to find matching closing brace
                    depth = 0
                    end_pos = None
                    for idx in range(brace_idx, len(joined)):
                        ch = joined[idx]
                        if ch == '{':
                            depth += 1
                        elif ch == '}':
                            depth -= 1
                            if depth == 0:
                                end_pos = idx
                                break
                    if end_pos is None:
                        # couldn't find closing brace; fallback to chunk
                        snippet = joined[:min(len(joined), 2000)]
                    else:
                        snippet = joined[:end_pos+1]
                    blocks.append(snippet.strip())
                    break
    return blocks


def normalize(s):
    # strip leading/trailing whitespace and collapse repeated blank lines
    if s is None:
        return ''
    lines = [l.rstrip() for l in s.splitlines()]
    # remove trailing/leading blank lines
    while lines and lines[0].strip() == '':
        lines.pop(0)
    while lines and lines[-1].strip() == '':
        lines.pop()
    return "\n".join(lines)


def main():
    if len(sys.argv) != 3:
        print("Usage: ci_verify_nowa_blocks.py <base_ref> <head_ref>", file=sys.stderr)
        sys.exit(1)
    base, head = sys.argv[1], sys.argv[2]

    files = files_with_token(base)
    if not files:
        print("No Nowa-generated files detected in base. Nothing to check.")
        sys.exit(0)

    failed = False
    for f in files:
        base_text = git_show(base, f)
        head_text = git_show(head, f)
        if base_text is None:
            # Should not happen often; skip
            print(f"Warning: file {f} not present at base {base}; skipping.")
            continue
        if head_text is None:
            print(f"ERROR: file {f} exists in base but is missing in head ({head}).", file=sys.stderr)
            failed = True
            continue
        base_blocks = extract_generated_blocks(base_text)
        head_blocks = extract_generated_blocks(head_text)
        # Compare counts; len can differ if generator added/removed blocks
        if len(base_blocks) != len(head_blocks):
            print(f"ERROR: number of @NowaGenerated blocks changed in {f} ({len(base_blocks)} -> {len(head_blocks)})", file=sys.stderr)
            failed = True
            # Print diffs of entire file for context
            diff = difflib.unified_diff(
                base_text.splitlines(), head_text.splitlines(),
                fromfile=f"{f}@{base}", tofile=f"{f}@{head}", lineterm=''
            )
            print("\n".join(diff), file=sys.stderr)
            continue
        # Compare each block
        for idx, (bb, hb) in enumerate(zip(base_blocks, head_blocks)):
            nb = normalize(bb)
            nh = normalize(hb)
            if nb != nh:
                print(f"ERROR: Nowa-generated block #{idx+1} changed in file: {f}", file=sys.stderr)
                diff = difflib.unified_diff(nb.splitlines(), nh.splitlines(), fromfile=f"{f}@{base}", tofile=f"{f}@{head}", lineterm='')
                print("\n".join(diff), file=sys.stderr)
                failed = True
    if failed:
        print("One or more Nowa-generated blocks were modified in this PR. Failing CI.", file=sys.stderr)
        sys.exit(2)
    print("OK: No modifications detected inside Nowa-generated blocks.")
    sys.exit(0)


if __name__ == '__main__':
    main()

