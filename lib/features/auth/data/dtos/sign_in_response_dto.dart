class SignInResponseDto {
  final int id;
  final String email;
  final String token;

  const SignInResponseDto({
    required this.id,
    required this.email,
    required this.token,
  });

  factory SignInResponseDto.fromJson(Map<String, dynamic> json) {
    return SignInResponseDto(
      id: json['id'] as int,
      email: json['emailAddress'] as String,
      token: json['token'] as String,
    );
  }  
}