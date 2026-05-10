import 'package:logger/logger.dart';

class LoggerConfig {
  static late Logger _logger;
  static bool _initialized = false;

  static void init({bool enableLogging = true}) {
    if (_initialized) return;

    _logger = Logger(
      printer: PrettyPrinter(
        methodCount: 2,
        errorMethodCount: 5,
        lineLength: 90,
        colors: true,
        printEmojis: true,
        dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
      ),
      level: enableLogging ? Level.debug : Level.off,
    );

    _initialized = true;
  }

  static Logger get instance => _logger;

  static void log(dynamic message) {
    if (_initialized) _logger.d(message);
  }

  static void error(dynamic error, [StackTrace? stackTrace]) {
    if (_initialized) _logger.e(error, stackTrace: stackTrace);
  }
}