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

Rules for automated edits (safety + conventions)
- Never change or remove `@NowaGenerated()` annotations or modify large generated-looking sections without: 1) confirming they are hand-authored, or 2) updating the upstream Nowa generator output.
- Do not commit or generate secrets inside repository files. If you must replace keys or keystores, use environment variables and document the variable names (see Android signing env vars above).
- Prefer minimal, localized edits. The app uses Provider-mounted global state; changing provider constructors or lifecycle behavior may have wide effects.
- If adding a new entrypoint, follow existing pattern: create `lib/main_<env>.dart`, perform any required initialization (SharedPreferences, Supabase), and wire the route into `lib/main.dart` or CI build command.

Where to look when things go wrong (quick pointers)
- Entrypoint and app wiring: `lib/main.dart`
- Global state & theme: `lib/globals/`
- Integrations: `lib/integrations/supabase_service.dart`
- Android build & signing: `android/app/build.gradle.kts` and `key.properties` (local only)
- SDK constraints and dependencies: `pubspec.yaml`
- Lints: `analysis_options.yaml`

Agent checklist before any write operation
1. Run `flutter pub get` and `flutter analyze` to ensure environment compatibility.
2. Run tests: `flutter test`.
3. If editing code that looks generated (`@NowaGenerated()`), open surrounding files and confirm hand-authored vs generated origin.
4. Avoid committing keys; if required, swap to environment-backed configuration and document the change in this file.

Contact/owners
- No CODEOWNERS or CONTRIBUTING file detected. Fallback: edit small PRs with clear descriptions and point reviewers to `lib/main.dart` and `lib/integrations/supabase_service.dart` for integration changes.

Last-updated: 2026-02-08

If you want, I can iterate and add: CI-specific steps for Codemagic, a minimal example PR template for secrets, or automated checks to detect accidental commits of secrets (e.g., scan for Supabase-like keys). Tell me which you'd prefer next.
