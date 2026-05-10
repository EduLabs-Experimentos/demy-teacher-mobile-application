class CourseResponseDto {
  final int id;
  final String name;
  final String code;
  final String description;

  const CourseResponseDto({
    required this.id,
    required this.name,
    required this.code,
    required this.description,
  });

  factory CourseResponseDto.fromJson(Map<String, dynamic> json) {
    return CourseResponseDto(
      id: json['id'] as int,
      name: json['name'] as String,
      code: json['code'] as String,
      description: json['description'] as String,
    );
  }
}