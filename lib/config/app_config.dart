import 'package:demy_teachers/config/environment/environment.dart';

class AppConfig {
  final Environment environment;
  final String baseUrl;
  final bool enableLogging;

  const AppConfig({
    required this.environment,
    required this.baseUrl,
    this.enableLogging = false,
  });

  static AppConfig forEnvironment(Environment env) {
    switch (env) {
      case Environment.dev:
        return const AppConfig(
          environment: Environment.dev,
          baseUrl: 'http://10.0.2.2:8080/api/v1',
          enableLogging: true,
        );
      case Environment.prod:
        return const AppConfig(
          environment: Environment.prod,
          baseUrl: 'https://nistra-demy.up.railway.app/api/v1',
          enableLogging: false,
        );
    }
  }
  
  String get label => environment.name.toUpperCase();

  @override
  String toString() {
    return 'AppConfig(environment: $environment, baseUrl: $baseUrl, enableLogging: $enableLogging)';
  }
}
