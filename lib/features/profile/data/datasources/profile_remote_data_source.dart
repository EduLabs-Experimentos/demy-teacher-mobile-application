import 'package:demy_teachers/features/profile/data/dtos/teacher_response_dto.dart';

abstract class ProfileRemoteDataSource {
  Future<TeacherResponseDto> getCurrentTeacher();
}