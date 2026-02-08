## Summary

(Short description of the change)

## Checklist for PRs touching Nowa-generated files
- If this PR modifies files that contain `@NowaGenerated()`, add `[nowa-generated]` to the PR title.
- Describe whether this change modifies generated code or provides a non-invasive wrapper.
- Attach the output of `flutter analyze` and `flutter test` if applicable.
- Ensure a Nowa-owner / maintainer reviews the PR.

## What I changed
- Files modified:
  - ...

## Notes
- If you changed integration secrets, ensure values are provided via `--dart-define` and do NOT commit secrets.

