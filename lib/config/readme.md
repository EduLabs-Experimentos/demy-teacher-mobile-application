# Configuration Layer

This directory contains the global configuration setup for the **Demy Teachers** app.  
It defines the app environment, base API URL, logging behavior, and other global settings.

## Structure

```
config/
├── app_config.dart         # Central configuration per environment
├── environment/
│ └── environment.dart      # Enum for Environment (dev, prod)
├── logger/
│ └── logger_config.dart    # Logging setup using the logger package
└── router/
└── app_router.dart         # Global navigation configuration
```

## Environments

The app supports multiple environments:
- **Development:** `Environment.dev`
- **Production:** `Environment.prod`

The current environment is defined at build time using Dart defines.

Example:
```bash
flutter run --dart-define=ENV=dev
flutter run --dart-define=ENV=prod
```

## Base URLs

Base URLs are set in AppConfig:

| Environment  | Base URL                                 |
|--------------|------------------------------------------|
| Development  | http://10.0.2.2:8080/api/v1              |
| Production   | https://nistra-demy.up.railway.app/api/v |

The NetworkModule automatically injects the correct base URL into Dio based on the current environment.

## Logging

Logging behavior is also tied to the environment:

- Enabled in development.
- Disabled in production.

## Quick Run Scripts

You can use helper scripts to run the app in different environments:

```bash
./scripts/run_dev.sh
./scripts/run_prod.sh
```