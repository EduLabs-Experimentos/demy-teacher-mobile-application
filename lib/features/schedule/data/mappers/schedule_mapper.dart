import 'package:demy_teachers/features/schedule/data/dtos/class_session_response_dto.dart';
import 'package:demy_teachers/features/schedule/data/dtos/classroom_response_dto.dart';
import 'package:demy_teachers/features/schedule/data/dtos/course_response_dto.dart';
import 'package:demy_teachers/features/schedule/data/dtos/teacher_response_dto.dart';
import 'package:demy_teachers/features/schedule/domain/entities/class_session.dart';
import 'package:demy_teachers/features/schedule/domain/entities/classroom.dart';
import 'package:demy_teachers/features/schedule/domain/entities/course.dart';
import 'package:demy_teachers/features/schedule/domain/entities/teacher.dart';


class ScheduleMapper {
  const ScheduleMapper._();

  static Course fromCourseDto(CourseResponseDto dto) {
    return Course(
      id: dto.id,
      name: dto.name,
      code: dto.code,
      description: dto.description,
    );
  }

  static Classroom fromClassroomDto(ClassroomResponseDto dto) {
    return Classroom(
      id: dto.id,
      code: dto.code,
      capacity: dto.capacity,
      campus: dto.campus,
    );
  }

  static Teacher fromTeacherDto(TeacherResponseDto dto) {
    return Teacher(
      id: dto.id,
      firstName: dto.firstName,
      lastName: dto.lastName,
      emailAddress: dto.emailAddress,
    );
  }

  static ClassSession fromDto(ClassSessionResponseDto dto) {
    return ClassSession(
      id: dto.id,
      startTime: dto.startTime,
      endTime: dto.endTime,
      dayOfWeek: dto.dayOfWeek,
      course: fromCourseDto(dto.course),
      classroom: fromClassroomDto(dto.classroom),
      teacher: fromTeacherDto(dto.teacher),
    );
  }
}