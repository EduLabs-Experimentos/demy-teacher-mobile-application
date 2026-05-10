class ErrorResource {
  final DateTime timestamp;
  final int status;
  final String error;
  final String code;
  final String message;
  final String path;

  const ErrorResource({
    required this.timestamp,
    required this.status,
    required this.error,
    required this.code,
    required this.message,
    required this.path,
  });

  factory ErrorResource.fromJson(Map<String, dynamic> json) {
    return ErrorResource(
      timestamp: DateTime.tryParse(json['timestamp'] ?? '') ?? DateTime.now(),
      status: json['status'] ?? 0,
      error: json['error'] ?? '',
      code: json['code'] ?? '',
      message: json['message'] ?? 'Unexpected error',
      path: json['path'] ?? '',
    );
  }
}
