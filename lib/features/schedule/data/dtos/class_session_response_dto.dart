import 'package:demy_teachers/features/schedule/data/dtos/classroom_response_dto.dart';
import 'package:demy_teachers/features/schedule/data/dtos/course_response_dto.dart';
import 'package:demy_teachers/features/schedule/data/dtos/teacher_response_dto.dart';

class ClassSessionResponseDto {
  final int id;
  final String startTime;
  final String endTime;
  final String dayOfWeek;
  final CourseResponseDto course;
  final ClassroomResponseDto classroom;
  final TeacherResponseDto teacher;

  const ClassSessionResponseDto({
    required this.id,
    required this.startTime,
    required this.endTime,
    required this.dayOfWeek,
    required this.course,
    required this.classroom,
    required this.teacher,
  });

  factory ClassSessionResponseDto.fromJson(Map<String, dynamic> json) {
    return ClassSessionResponseDto(
      id: json['id'] as int,
      startTime: json['startTime'] as String,
      endTime: json['endTime'] as String,
      dayOfWeek: json['dayOfWeek'] as String,
      course: CourseResponseDto.fromJson(json['course'] as Map<String, dynamic>),
      classroom: ClassroomResponseDto.fromJson(json['classroom'] as Map<String, dynamic>),
      teacher: TeacherResponseDto.fromJson(json['teacher'] as Map<String, dynamic>),
    );
  }
}