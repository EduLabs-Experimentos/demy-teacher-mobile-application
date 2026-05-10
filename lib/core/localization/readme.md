# Localization Module

This folder contains the **internationalization (i18n)** and **localization (l10n)** setup for the Demy Teachers Flutter application.  
It provides the foundation for supporting multiple languages in a consistent and maintainable way.

## Structure
```
core/
 └── localization/
     ├── i18n.dart              # Central configuration (delegates, locales, helper methods)
     └── l10n/                  # Translation resources
         ├── app_en.arb         # English translation file
         ├── app_es.arb         # Spanish translation file
         └── untranslated_messages.txt
```

## How It Works
- `.arb` files store all translated strings.  
- Each message key must be identical across languages.
- Metadata can be added using ``"key": { "description": "..." }`` for translator context.
- The `i18n.dart` file defines the list of supported locales and delegates used by `MaterialApp`.

## Commands
- After editing any `.arb` file, run:
  `flutter gen-l10n`
- This regenerates the `app_localizations.dart` file automatically.

## Usage
In any widget:
```dart
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final t = AppLocalizations.of(context);
Text(t.login);
```

## Guidelines
- Always provide English as the base language (`app_en.arb`).
- Keep descriptions clear for translators.
- Avoid removing keys unless confirmed unused across all features.
- Do not modify the generated `app_localizations.dart` file manually.
