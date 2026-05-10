class RequestResetPasswordDto {
  final String emailAddress;

  const RequestResetPasswordDto({
    required this.emailAddress,
  });

  Map<String, dynamic> toJson() {
    return {
      'emailAddress': emailAddress,
    };
  }
}
