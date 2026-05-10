import 'package:dartz/dartz.dart';
import 'package:demy_teachers/core/errors/failure.dart';
import 'package:demy_teachers/features/auth/domain/entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> signIn(String email, String password);

  Future<Either<Failure, void>> requestResetPassword(String emailAddress);

  Future<Either<Failure, void>> verifyResetCode(String emailAddress, String code);

  Future<Either<Failure, User>> resetPassword(
    String emailAddress,
    String password,
    String confirmPassword,
  );

  Future<String?> getCachedToken();

  Future<Map<String, String?>> getCachedUser();

  Future<User?> getCachedUserEntity();

  Future<void> signOut();
}