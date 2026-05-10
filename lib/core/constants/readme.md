# API Constants

This file defines reusable **API endpoint constants** used across the project.  
Centralizing these values helps ensure consistency and simplifies future updates.

## Example
```dart
class ApiConstants {
  static const String authEndpointPath = '/auth';
}
```

## Usage
Import and reference constants instead of hardcoding strings:
```dart
class AuthEndpoints {
  static const String _authBase = ApiConstants.authEndpointPath;

  static const String signIn = '$_authBase/sign-in';
  static const String signUp = '$_authBase/sign-up';
}
```

## Guidelines
- Use this file only for **static API paths** (e.g., `/auth`, `/users`, `/courses`).
- Keep environment-specific URLs (like `baseUrl`) inside the app configuration (`AppConfig`).
- When adding new endpoints, follow a clear and consistent naming convention.
