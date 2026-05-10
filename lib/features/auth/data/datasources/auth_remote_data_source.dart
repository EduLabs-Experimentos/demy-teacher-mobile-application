import 'package:demy_teachers/features/auth/domain/entities/user.dart';

abstract class AuthRemoteDataSource {
  Future<User> signIn(String email, String password);
  Future<void> requestResetPassword(String emailAddress);
  Future<void> verifyResetCode(String emailAddress, String code);
  Future<User> resetPassword(String emailAddress, String password, String confirmPassword);
}