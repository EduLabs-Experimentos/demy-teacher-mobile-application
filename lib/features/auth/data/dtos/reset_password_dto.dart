class ResetPasswordDto {
  final String emailAddress;
  final String password;
  final String confirmPassword;

  const ResetPasswordDto({
    required this.emailAddress,
    required this.password,
    required this.confirmPassword,
  });

  Map<String, dynamic> toJson() {
    return {
      'emailAddress': emailAddress,
      'password': password,
      'confirmPassword': confirmPassword,
    };
  }
}

class ResetPasswordResponseDto {
  final int id;
  final String emailAddress;
  final String token;

  const ResetPasswordResponseDto({
    required this.id,
    required this.emailAddress,
    required this.token,
  });

  factory ResetPasswordResponseDto.fromJson(Map<String, dynamic> json) {
    return ResetPasswordResponseDto(
      id: json['id'] as int,
      emailAddress: json['emailAddress'] as String,
      token: json['token'] as String,
    );
  }
}
