enum Environment { dev, prod }

extension EnvironmentName on Environment {
  String get name {
    switch (this) {
      case Environment.dev:
        return 'Development';
      case Environment.prod:
        return 'Production';
    }
  }

  bool get isDev => this == Environment.dev;
  
  bool get isProd => this == Environment.prod;
}
