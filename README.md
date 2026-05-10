# Demy Admins App – Flutter Mobile (Dart + Flutter SDK)

This repository contains the **mobile application** of the **Demy** project, developed in **Flutter** using **Dart**.  
The goal is to provide a modern, cross-platform, and accessible mobile app for the **administrator segment**, aligned with the project’s backend and academic requirements.

---

## Features  

- **Modern UI with Flutter & Material Design 3**  
- **Cross-platform** support (Android and iOS)  
- **State management** with BLoC / Cubit or Provider  
- **Internationalization (i18n)** for multi-language support  
- **Accessibility (a11y)** aligned with **WCAG** guidelines  
- **Theming** with dynamic light/dark modes  
- **Offline support** (via local storage or caching if applicable)  

---

## Architecture – Clean Architecture + Modular Design

The project follows **Clean Architecture principles** with **feature-based modularization**.  
Although it is a single Flutter project, the internal organization follows **domain-driven separation** by features.

```
lib/
├─ core/            # Shared utilities, theme, routing, localization, errors
└─ features/
    ├─ login/       # Authentication flow (UI + logic)
    ├─ home/        # Main administrator dashboard
    ├─ profile/     # Administrator profile and settings
    └─ ...
```

- **Presentation layer** → UI (Widgets, Screens) + State Management (BLoC/Provider)  
- **Domain layer** → Use cases and entities  
- **Data layer** → Repositories and API or local storage  

---

## Installation / Setup  

### Prerequisites
- **Flutter SDK** (latest stable)
- **Dart SDK** (bundled with Flutter)
- **Android Studio**, **VS Code**, or **IntelliJ IDEA**
- Emulator or physical device (Android/iOS)
- (Optional) **fvm** for Flutter version management

### Run locally
```bash
# Clone repository
git clone https://github.com/<org>/<repo>.git
cd <repo>

# Get dependencies
flutter pub get

# Run app
flutter run
```

> Tip: Make sure to check your setup with `flutter doctor` before running the app.

---

## Project structure

- `lib/` → main source code (organized by core and features)  
- `assets/` → images, fonts, and localization files  
- `test/` → unit and widget tests  
- `integration_test/` → end-to-end integration tests  
- `docs/` → extended documentation (guides, diagrams, design system)  
- `CONTRIBUTING.md` → collaboration and commit rules  
- `CODE_OF_CONDUCT.md` → behavior and community guidelines  
- `SECURITY.md` → reporting and handling vulnerabilities  
- `AUTHORS.md` → list of contributors  

---

## Contributing

We use GitHub **Issues** and **Pull Requests** to collaborate.  
Please use the provided templates when creating:
- Bug reports  
- Feature requests  
- UI/UX issues  
- Performance issues  
- Refactors / technical debt  
- Documentation improvements  
- General issues  

See [CONTRIBUTING.md](./CONTRIBUTING.md) for full details.  
Please also review our [Code of Conduct](./CODE_OF_CONDUCT.md).

---

## Issue Templates

Available in [`.github/ISSUE_TEMPLATE/`](./.github/ISSUE_TEMPLATE/):

- Bug Report  
- Feature Request  
- UI/UX Issue  
- Performance Issue  
- Refactor / Technical Debt  
- Documentation  
- Generic  

---

## Extended Documentation

Additional documentation can be found in the [`docs/`](./docs/) folder:

- [Architecture](./docs/architecture/clean-overview.md) → Clean Architecture, navigation diagram, UML  
- [Guides](./docs/guides/setup.md) → Setup instructions, Git workflow, testing  
- [Design](./docs/design/style-guide.md) → UI/UX guidelines, accessibility, screenshots  
- [API](./docs/api/backend-integration.md) → Backend endpoints and data flow  
- [References](./docs/references/bibliography.md) → Official docs, articles, resources  

---

## Security

If you discover a security vulnerability, please follow the instructions in [SECURITY.md](./SECURITY.md).  
**Do not disclose details publicly in issues or pull requests.**

---

## Authors

See the complete list of contributors in [AUTHORS.md](./AUTHORS.md).

---

## Project status

This is an **academic and private** project, developed by the Software Engineering team – UPC.  
External contributions are **not accepted**.
