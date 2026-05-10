class VerifyResetCodeDto {
  final String emailAddress;
  final String code;

  const VerifyResetCodeDto({
    required this.emailAddress,
    required this.code,
  });

  Map<String, dynamic> toJson() {
    return {
      'emailAddress': emailAddress,
      'code': code,
    };
  }
}

class VerifyResetCodeResponseDto {
  final String message;

  const VerifyResetCodeResponseDto({
    required this.message,
  });

  factory VerifyResetCodeResponseDto.fromJson(Map<String, dynamic> json) {
    return VerifyResetCodeResponseDto(
      message: json['message'] as String,
    );
  }
}
