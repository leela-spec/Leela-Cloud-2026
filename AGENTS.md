# AGENTS.md — How automated coding agents should operate on this repo

Purpose: give an automated agent the exact, discoverable knowledge it needs to build, test, and safely modify this Flutter project (leela_cloud_2026).

Quick repo map (files to open first)
- `pubspec.yaml` — dependencies and SDK constraint (Dart SDK >=3.2.0 <4.0.0). See root for `provider`, `nowa_runtime`, `supabase_flutter`, etc.
- `lib/main.dart` — single app entrypoint. Initializes SharedPreferences and Supabase, registers providers via `MultiProvider`.
- `lib/integrations/supabase_service.dart` — Supabase initialization and auth wrapper (contains a committed anon key & URL).
- `lib/globals/` — app-wide state (e.g., `app_state.dart`, `g_s_data.dart`, `g_s_spark.dart`) and theme.
- `android/app/build.gradle.kts` — Android namespace/applicationId, SDK versions, signing config and CI hooks (Codemagic env vars).
- `test/` — unit/widget tests (run with `flutter test`).
- `assets/` and `build/flutter_assets/` — static assets (verify `pubspec.yaml` when adding new assets).

Quick start (prereqs)
- Install Flutter matching constraints in `pubspec.yaml` (Dart SDK >=3.2.0 <4.0.0).
- Java 11 (the Gradle config targets Java 11). Ensure `JAVA_HOME` points to Java 11 for Android builds.
- Android SDK + platform tools for Android builds. For iOS builds a macOS runner with Xcode and CocoaPods is required.

Essential commands (local dev)
- flutter pub get
- flutter analyze
- flutter test
- flutter run (launch on connected device/emulator)

Build commands (examples)
- Android (local debug): flutter build apk --debug
- Android (release): flutter build apk --release
- Android App Bundle (preferred for Play Store): flutter build appbundle --release --target-platform android-arm64
- iOS (macOS required): flutter build ios --release --no-codesign

Code generation / generators
- No `build_runner`/`freezed`/`json_serializable` entries found in `pubspec.yaml` (dev_dependencies). However, many source files are annotated with `@NowaGenerated()` and the project depends on `nowa_runtime`.
- Action for agents: do NOT assume a `build_runner` step is present. Treat `@NowaGenerated` annotations as signals that code originates from or integrates with the Nowa toolchain. Avoid editing annotated sections unless you understand Nowa's expectations.

State management & DI patterns
- Provider is used as the state management solution. `lib/main.dart` sets up a `MultiProvider` with `AppState`, `GS_Data`, and `GS_Spark`:
  - App-level state lives in `lib/globals/app_state.dart` and `lib/globals/*`.
- No `GetIt`/`injectable`/`get_it` usage detected in repo search; DI is manual via Provider constructors in `main.dart`.

Integrations & secrets
- Supabase: `lib/integrations/supabase_service.dart` initializes Supabase with a URL and an anon key that are currently present in source. This is sensitive information — automation should not leak or commit changes that expose new secrets.
  - Supabase initialization runs in `main()` before `runApp()`.
- Android signing: `android/app/build.gradle.kts` reads `key.properties` locally, and in CI will look for Codemagic env vars:
  - CM_BUILD_DIR, CM_KEYSTORE_PASSWORD, CM_KEY_ALIAS, CM_KEY_PASSWORD (used when `CI` env var is set).
  - If adding signing automation, prefer injecting keystore and passwords via secure env vars.

CI & release notes
- No GitHub Actions workflows found under `.github/workflows/` in the current tree. The Android Gradle setup includes explicit handling for Codemagic environment variables; CI jobs elsewhere (external) may expect these env var names.

Tests
- Unit/widget tests can be run with `flutter test`.
- No `integration_test` runner or `flutter_driver` usage detected; treat integration tests as absent unless new tests are added.

Common troubleshooting steps (project-specific)
- If a build or generator fails, run:
  - flutter clean; flutter pub get; then retry the failing step.
- If Android build fails, verify `local.properties` points to an Android SDK and `JAVA_HOME` is Java 11.
- If iOS build fails, run `pod install` in `ios/` and ensure Xcode command line tools and a valid signing setup are present.

NOWA-generated code: guardrails, prompts, and automation rules

Purpose: Nowa (Claude Haiku) generates many UI classes and annotations in this repo. To avoid generators or other agents accidentally deleting or breaking Nowa output, follow the rules below.

Golden rule
- NEVER delete or remove `@NowaGenerated()` or any contiguous generated blocks produced by Nowa without either:
  - Regenerating with the Nowa toolchain and committing the regeneration output, or
  - Explicit approval from a human maintainer (mark PR title `[nowa-generated]` and request Nowa-owner review).

What counts as generated-looking code
- Any file that contains the `@NowaGenerated()` annotation (exact token) — e.g., `lib/main.dart`, `lib/pages/s_c_r_spark_pre_run.dart` — should be treated as potentially generated.
- Repetitive `@NowaGenerated({...})` metadata and `auto-constructor` comments are strong signals that the code was produced by Nowa.

Do / Don't (short)
- Do: Read the surrounding file and add non-invasive wrappers to extend behavior (create `*_wrapper.dart` files for custom logic).
- Do: If you must change generated code, create a PR tagged `[nowa-generated]`, describe why the change is needed, and request a human reviewer who understands Nowa.
- Don't: Remove or edit `@NowaGenerated()` annotations.
- Don't: Inline long feature changes into generated files; prefer adding a separate file that composes/uses the generated class.

Prompting best-practices for the NOWA agent (Claude Haiku)
- Required in every prompt to Nowa/Claude Haiku:
  1. State the exact file(s) to modify, using repository paths (e.g., `lib/pages/s_c_r_spark_pre_run.dart`).
  2. Explicitly list forbidden tokens: `DO NOT REMOVE OR CHANGE '@NowaGenerated()'`.
  3. Provide allowed modification region: either "only inside TODO block X" or "only add new file Y".
  4. Provide an explicit test or smoke-check the agent must run locally after changes (e.g., `flutter analyze` & `flutter test`).

- Minimal prompt template (use verbatim):

  Edit instructions for Nowa-generated content
  - Files: lib/pages/s_c_r_spark_pre_run.dart
  - Allowed edits: add a new wrapper file `lib/pages/s_c_r_spark_pre_run_wrapper.dart` that composes `SCR_Spark_PreRun`. Do NOT edit any line containing `@NowaGenerated()`.
  - Forbidden tokens: `@NowaGenerated()`
  - Post-change checks: run `flutter analyze` and `flutter test` locally; include failing output in the PR if any.

Automation guardrails (pre-commit & CI)
- We provide scripts in `scripts/` and a sample GitHub Actions workflow to detect accidental deletion or removal of `@NowaGenerated()` tokens.
- Pre-commit hook (recommended, local): configure your repo to use `.githooks/` as hooks path and enable the provided script:
  - git config core.hooksPath .githooks
  - The hook runs `scripts/verify_nowa_generated.sh` (bash) on commit and blocks if it would remove annotations.
- CI check (recommended, enforced): a GitHub Actions workflow runs `scripts/ci_verify_nowa_generated.sh` on pull requests and fails the job if any `@NowaGenerated()` annotation present in the base branch was removed in the PR.

Where to place human-facing changes
- Prefer adding a small wrapper file next to the generated file. Example pattern:
  - Generated: `lib/pages/s_c_r_spark_pre_run.dart` (contains `SCR_Spark_PreRun`)
  - Wrapper: `lib/pages/s_c_r_spark_pre_run_wrapper.dart` creates `SCR_Spark_PreRunWrapper` that imports and composes `SCR_Spark_PreRun` and contains custom logic.

PR conventions for generated-code edits
- PR title must include `[nowa-generated]` when touching generated code.
- Include a short explanation and a pointer to the Nowa regeneration step if applicable.
- Require one human reviewer with knowledge of Nowa generator output.

Secrets & sensitive data
- Do not commit secrets in generated or any files. If you must replace a key (e.g., Supabase anon key in `lib/integrations/supabase_service.dart`), replace it with env-backed configuration and document the env var names in this file.

Agent checklist before any write operation (extended)
1. Run `flutter pub get` and `flutter analyze`.
2. Run `flutter test`.
3. Search for `@NowaGenerated` in files you will change. If present, do not alter these lines.
4. If modifying generated code is unavoidable, open a PR with `[nowa-generated]` and request Nowa-owner review.

Where to look when things go wrong (quick pointers)
- Entrypoint and app wiring: `lib/main.dart`
- Global state & theme: `lib/globals/`
- Integrations: `lib/integrations/supabase_service.dart`
- Android build & signing: `android/app/build.gradle.kts` and `key.properties` (local only)
- SDK constraints and dependencies: `pubspec.yaml`
- Lints: `analysis_options.yaml`

Contact/owners
- No CODEOWNERS or CONTRIBUTING file detected. Fallback: submit a small PR and request a reviewer; include references to `lib/main.dart` and `lib/integrations/supabase_service.dart` for integration changes.

Last-updated: 2026-02-08

If you'd like, I can now create the pre-commit and CI script files and add the sample GitHub Actions workflow (I will add bash + PowerShell versions and hook samples).
