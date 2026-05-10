class TeacherResponseDto {
  final int id;
  final String firstName;
  final String lastName;
  final String emailAddress;
  final String phoneNumber;
  final int userId;

  const TeacherResponseDto({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.emailAddress,
    required this.phoneNumber,
    required this.userId,
  });

  factory TeacherResponseDto.fromJson(Map<String, dynamic> json) {
    return TeacherResponseDto(
      id: json['id'] as int,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      emailAddress: json['emailAddress'] as String,
      phoneNumber: json['phoneNumber'] as String,
      userId: json['userId'] as int,
    );
  }
}
