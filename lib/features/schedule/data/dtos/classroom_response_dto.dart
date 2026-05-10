class ClassroomResponseDto {
  final int id;
  final String code;
  final int capacity;
  final String campus;

  const ClassroomResponseDto({
    required this.id,
    required this.code,
    required this.capacity,
    required this.campus,
  });

  factory ClassroomResponseDto.fromJson(Map<String, dynamic> json) {
    return ClassroomResponseDto(
      id: json['id'] as int,
      code: json['code'] as String,
      capacity: json['capacity'] as int,
      campus: json['campus'] as String,
    );
  }
}