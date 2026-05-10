class ApiResponse<T> {
  final T? data;
  final String? message;
  final int? statusCode;
  final bool success;

  const ApiResponse({
    this.data,
    this.message,
    this.statusCode,
    this.success = true,
  });

  factory ApiResponse.error(String message, {int? code}) {
    return ApiResponse(
      data: null,
      message: message,
      statusCode: code,
      success: false,
    );
  }
}
