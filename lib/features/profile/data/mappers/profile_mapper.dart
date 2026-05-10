import 'package:demy_teachers/features/profile/data/dtos/teacher_response_dto.dart';
import 'package:demy_teachers/features/profile/domain/entities/teacher.dart';

class ProfileMapper {
  static Teacher fromDto(TeacherResponseDto dto) {
    return Teacher(
      id: dto.id,
      firstName: dto.firstName,
      lastName: dto.lastName,
      fullName: '${dto.firstName} ${dto.lastName}',
      emailAddress: dto.emailAddress,
      phoneNumber: dto.phoneNumber,
      userId: dto.userId,
    );
  }
}
