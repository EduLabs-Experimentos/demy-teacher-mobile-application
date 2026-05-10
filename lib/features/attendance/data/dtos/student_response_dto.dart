class StudentResponseDto {
  final int id;
  final String firstName;
  final String lastName;
  final String dni;
  final String? photoUrl;

  const StudentResponseDto({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.dni,
    this.photoUrl,
  });

  factory StudentResponseDto.fromJson(Map<String, dynamic> json) {
    return StudentResponseDto(
      id: json['id'] ?? 0,
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      dni: json['dni'] ?? '',
      // Asume que la foto podría venir, o manéjalo en el mapper
      photoUrl: json['profilePicture'], 
    );
  }
}