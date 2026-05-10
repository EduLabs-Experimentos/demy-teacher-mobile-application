import 'package:demy_teachers/features/auth/data/dtos/sign_in_response_dto.dart';
import 'package:demy_teachers/features/auth/domain/entities/user.dart';

class UserMapper {
  const UserMapper._(); // Private constructor to prevent instantiation

  static User fromDto(SignInResponseDto dto) {
    return User(
      id: dto.id,
      email: dto.email,
      token: dto.token,
    );
  }
}