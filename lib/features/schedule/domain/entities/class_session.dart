import 'package:demy_teachers/features/schedule/domain/entities/classroom.dart';
import 'package:demy_teachers/features/schedule/domain/entities/course.dart';
import 'package:demy_teachers/features/schedule/domain/entities/teacher.dart';

class ClassSession {
  final int id;
  final String startTime;
  final String endTime;
  final String dayOfWeek;
  final Course course;
  final Classroom classroom;
  final Teacher teacher; 

  const ClassSession({
    required this.id,
    required this.startTime,
    required this.endTime,
    required this.dayOfWeek,
    required this.course,
    required this.classroom,
    required this.teacher, 
  });
}