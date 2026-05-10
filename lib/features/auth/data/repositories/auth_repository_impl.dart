import 'package:dartz/dartz.dart';
import 'package:demy_teachers/core/errors/failure.dart';
import 'package:demy_teachers/core/utils/safe_call.dart';
import 'package:demy_teachers/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:demy_teachers/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:demy_teachers/features/auth/domain/entities/user.dart';
import 'package:demy_teachers/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalDataSource localDataSource;
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.localDataSource, this.remoteDataSource);

  @override
  Future<Either<Failure, User>> signIn(String email, String password) async {
    return safeCall(() async {
      final user = await remoteDataSource.signIn(email, password);
      await localDataSource.saveToken(user.token);
      await localDataSource.saveUser(id: user.id, email: user.email);
      return user;
    });
  }

  @override
  Future<Either<Failure, void>> requestResetPassword(String emailAddress) async {
    return safeCall(() async {
      await remoteDataSource.requestResetPassword(emailAddress);
    });
  }

  @override
  Future<Either<Failure, void>> verifyResetCode(String emailAddress, String code) async {
    return safeCall(() async {
      await remoteDataSource.verifyResetCode(emailAddress, code);
    });
  }

  @override
  Future<Either<Failure, User>> resetPassword(
    String emailAddress,
    String password,
    String confirmPassword,
  ) async {
    return safeCall(() async {
      final user = await remoteDataSource.resetPassword(emailAddress, password, confirmPassword);
      await localDataSource.saveToken(user.token);
      await localDataSource.saveUser(id: user.id, email: user.email);
      return user;
    });
  }

  @override
  Future<String?> getCachedToken() async {
    return await localDataSource.getToken();
  }

  @override
  Future<Map<String, String?>> getCachedUser() async {
    return await localDataSource.getUser();
  }

  @override
  Future<User?> getCachedUserEntity() async {
    final userData = await localDataSource.getUser();
    final token = await localDataSource.getToken();

    final id = userData['id'];
    final email = userData['email'];

    if (id == null || email == null || token == null) return null;

    return User(
      id: int.parse(id),
      email: email,
      token: token,
    );
  }

  @override
  Future<void> signOut() async {
    await localDataSource.clearToken();
    await localDataSource.clearUser();
  }
}