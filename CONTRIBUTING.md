# Collaboration Guide (Flutter)

Available languages:  
- [English](CONTRIBUTING.md)  
- [Spanish](CONTRIBUTING.es.md)

This repository contains the **Flutter mobile application** of the **Demy** project.  
This guide defines how we work as a team to maintain an organized and consistent workflow.

---

## 1) Quick Introduction

### Requirements
- **Flutter SDK** (latest stable)
- **Dart SDK** (bundled with Flutter)
- **Android Studio**, **VS Code**, or **IntelliJ IDEA**
- Emulator or physical device (Android/iOS)
- Optional: **fvm** for Flutter version management

### Clone the repository
```bash
git clone <REPOSITORY-URL>
cd <REPO-NAME>
```

### Configure your Git user
```bash
git config --global user.name "Your Name"
git config --global user.email "your.email`example.com"
```

### Open the project
1. Open **VS Code** or **Android Studio** → *Open Folder* → select the repo folder.  
2. Run `flutter pub get` to fetch dependencies.  
3. Verify your environment with `flutter doctor`.

### Build and run
```bash
# Get dependencies
flutter pub get

# Run the app (pick a device or emulator)
flutter run

# Analyze code
flutter analyze

# Run tests
flutter test
```

> Tip: If this is your first contribution, create a feature branch first (see *Git Workflow* section).

---

## 2) Git Workflow

- Central repository: **GitHub**. Main branch: `main`.  
- Branching model: **Gitflow** (adapted for Flutter).
  - `main`: stable releases (academic milestones)  
  - `develop`: integration of new features  
  - Support branches:
    - `feature/<topic>` → new features (e.g., `feature/login-screen`, `feature/profile-edit`)  
    - `hotfix/<name>` → critical production fixes (e.g., `hotfix/fix-crash-on-start`)  
    - `release/vX.Y.Z` → release preparation (e.g., `release/v1.0.0`)

### Keep your branch up to date (with `develop`)
```bash
git checkout feature/login-screen
git fetch origin
git merge origin/develop
git push origin feature/login-screen
```

### Create your feature branch (from `develop`)
```bash
git checkout develop
git pull origin develop
git checkout -b feature/<your-topic>
```

---

## 3) Commit Messages (Conventional Commits)

We follow the **Conventional Commits** standard with an **optional scope** to indicate the affected area.

**Format**  
`<type>(<scope>): <message>`

**Common types**
- `feat` → new functionality (screen/component)
- `fix` → bug fix
- `refactor` → code improvement without behavior change
- `perf` → performance improvement
- `docs` → documentation (README, guides)
- `build` → dependencies or configuration updates
- `ci` → CI/CD scripts
- `test` → unit/widget/integration tests
- `style` → formatting (no logic changes)
- `chore` → maintenance tasks

**Suggested scopes (Flutter)**
- `feature_login`, `feature_home`, `feature_profile`
- `ui`, `navigation`, `core`, `data`, `network`, `i18n`, `a11y`, `bloc`, `provider`, `build`

**Examples**
```
feat(feature_login): add email/password sign-in flow
fix(ui): avoid overflow in HomePage on small screens
refactor(core): extract Result<T> and Either helpers
perf(feature_home): cache API responses to reduce jank
docs(readme): add setup and run instructions
build(pubspec): bump flutter_bloc and dio versions
```

---

## 4) Pull Requests (PR)

- **Base branch**: `develop` (never `main`).  
- Use the **PR template** and explain **what** you changed and **why**.  
- If applicable, link an Issue with `Closes #<issue-number>`.  
- Request review from **at least one teammate**.  
- Merge strategy: **Merge commit** (not squash) to keep full history.

### Checklist before opening a PR
- [ ] `feature/*` branch is synchronized with `origin/develop`.  
- [ ] Project gets dependencies and analyzes cleanly: `flutter pub get`, `flutter analyze`.  
- [ ] Tests pass (if applicable): `flutter test` (unit/widget).  
- [ ] Integration tests pass (if applicable): `flutter test integration_test` (see section 7).  
- [ ] App manually tested on emulator/device (attach screenshots/GIF for UI changes).  
- [ ] No secrets/keys/tokens committed.  
- [ ] Commit messages follow **Conventional Commits**.  
- [ ] Accessibility (a11y) and i18n verified if UI was modified.

---

## 5) Scope of Changes

- One **logical change per PR** (avoid giant PRs).  
- Respect the organization:
  - **`lib/core`**: theming, routing, utils, error handling, constants  
  - **`lib/features/<feature_name>`**: split by feature (data/domain/presentation if needed)  
  - **`assets/`**: images, fonts, translations (`assets/i18n`)  
- Networking: centralize clients/interceptors (e.g., `lib/core/network`).  
- State management: prefer consistent patterns (e.g., **BLoC**/`Cubit` or **Provider**), avoid mixing styles within the same feature.  
- Always consider **i18n** (ARBs/JSON) and **a11y** (semantics, labels, contrast).

---

## 6) Code Style and Conventions

This project uses **Dart** and **Flutter**. Keep the codebase clean, readable, and maintainable.

### General rules
- Use **UTF-8** encoding.  
- Maximum line length: **120 characters**.  
- Indentation: **2 spaces** (no tabs).  
- One public class per file when possible; keep files cohesive.  
- Do not commit commented-out or dead code.  
- Run `dart format .` and `flutter analyze` before committing.

### Dart/Flutter conventions
- **Classes/Enums**: PascalCase (`UserProfile`, `LoginCubit`)  
- **Functions/variables**: camelCase (`loadUserData()`, `userName`)  
- **Constants**: UPPER_CASE_WITH_UNDERSCORES (`MAX_RETRIES`)  
- **Directories**: feature-based (`features/login`, `core/navigation`)  
- Prefer `final`/const, immutable models (``immutable`), and small widgets.  
- Extract widgets and methods to reduce nesting and improve readability.

### UI guidelines
- Follow **Material 3** (themes, color scheme, typography).  
- Use **state hoisting**; avoid unnecessary rebuilds.  
- Provide **Semantics** and **alt text** for images/icons.  
- Test layout on multiple sizes (small/large screens).  
- Keep assets referenced in `pubspec.yaml` synchronized with the repo.

---

## 7) Testing Practices

- Write **unit tests** for services, repositories, and pure logic.  
- Write **widget tests** for UI components and simple flows.  
- Add **integration tests** under `integration_test/` for end-to-end flows.  
- Keep tests **fast and isolated**; use fakes/mocks for IO.

### Running tests
```bash
# Unit & widget tests
flutter test

# Integration tests (ensure a device/emulator is running)
flutter test integration_test
```

### Guidelines
- One main assertion per test or a clear arrange–act–assert structure.  
- Descriptive names: `login_fails_with_invalid_password()`.  
- Avoid flaky tests (timing issues); use `pumpAndSettle()` judiciously.

---

## 8) Best Practices

- One feature or bug fix per branch/PR.  
- Keep PRs small and focused.  
- Write **clear commit messages** (Conventional Commits).  
- Ensure **i18n** (no hardcoded strings).  
- Ensure **a11y** (labels, focus order, contrast).  
- Run the app on at least **one emulator and one real device** before merging.  
- Never commit secrets, API keys, or credentials.  
- Document new or changed behavior in the PR description.

---

## 9) Builds & Releases

Common commands:
```bash
# Android APK (debug/release)
flutter build apk --release

# Android App Bundle (Play Store)
flutter build appbundle --release

# iOS (requires macOS/Xcode)
flutter build ipa --release
```

Tag releases from `main` using `release/vX.Y.Z` branches and GitHub Releases.

---

## 10) Conflict Resolution

- Regularly update your branch with `develop` to reduce conflicts:
```bash
git checkout feature/<name>
git fetch origin
git merge origin/develop
```

- If conflicts occur:
  - Resolve locally and commit.  
  - For **core files** (routing, theme, build config), coordinate with the team before resolving.  
- Avoid force pushes unless absolutely necessary (`git push --force`).

---

## 11) Communication

- Use the agreed team channel (Discord/WhatsApp) for coordination.  
- When opening a PR:
  - Describe **what** you changed and **why**.  
  - Tag at least one teammate for review.  
- Use GitHub Issues with the correct template (Bug, Feature, UI/UX, etc.).  
- Keep communication clear, respectful, and professional (see [Code of Conduct](./CODE_OF_CONDUCT.md)).

---

## 12) Security Policy

Please do not report vulnerabilities publicly in Issues or PRs.  
See [SECURITY.md](./SECURITY.md) for details on how to report them privately.

---
