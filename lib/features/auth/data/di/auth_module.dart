import 'package:demy_teachers/core/network/api_client.dart';
import 'package:demy_teachers/core/services/token_provider.dart';
import 'package:demy_teachers/core/storage/session_storage.dart';
import 'package:demy_teachers/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:demy_teachers/features/auth/data/datasources/auth_local_data_source_impl.dart';
import 'package:demy_teachers/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:demy_teachers/features/auth/data/datasources/auth_remote_data_source_impl.dart';
import 'package:demy_teachers/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:demy_teachers/features/auth/data/services/auth_token_provider.dart';
import 'package:demy_teachers/features/auth/domain/repositories/auth_repository.dart';
import 'package:demy_teachers/features/auth/domain/usecases/request_reset_password_use_case.dart';
import 'package:demy_teachers/features/auth/domain/usecases/reset_password_use_case.dart';
import 'package:demy_teachers/features/auth/domain/usecases/sign_in_use_case.dart';
import 'package:demy_teachers/features/auth/domain/usecases/verify_reset_code_use_case.dart';
import 'package:demy_teachers/features/auth/presentation/blocs/auth_bloc.dart';
import 'package:demy_teachers/features/auth/presentation/blocs/reset_password_bloc.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AuthModule {
  @lazySingleton
  AuthLocalDataSource authLocalDataSource(SessionStorage storage) =>
      AuthLocalDataSourceImpl(storage);

  @lazySingleton
  TokenProvider tokenProvider(AuthLocalDataSource ds) =>
      AuthTokenProvider(ds);

  @lazySingleton
  AuthRemoteDataSource authRemoteDataSource(ApiClient apiClient) =>
      AuthRemoteDataSourceImpl(apiClient);

  @lazySingleton
  AuthRepository authRepository(AuthLocalDataSource local, AuthRemoteDataSource remote) =>
      AuthRepositoryImpl(local, remote);

  @lazySingleton
  SignInUser signInUser(AuthRepository repo) => SignInUser(repo);

  @lazySingleton
  RequestResetPasswordUseCase requestResetPasswordUseCase(AuthRepository repo) =>
      RequestResetPasswordUseCase(repo);

  @lazySingleton
  VerifyResetCodeUseCase verifyResetCodeUseCase(AuthRepository repo) =>
      VerifyResetCodeUseCase(repo);

  @lazySingleton
  ResetPasswordUseCase resetPasswordUseCase(AuthRepository repo) =>
      ResetPasswordUseCase(repo);

  @injectable
  AuthBloc authBloc(SignInUser signInUser, AuthRepository repository) =>
      AuthBloc(signInUser: signInUser, repository: repository);

  @injectable
  ResetPasswordBloc resetPasswordBloc(
    RequestResetPasswordUseCase requestUseCase,
    VerifyResetCodeUseCase verifyUseCase,
    ResetPasswordUseCase resetUseCase,
  ) =>
      ResetPasswordBloc(
        requestResetPasswordUseCase: requestUseCase,
        verifyResetCodeUseCase: verifyUseCase,
        resetPasswordUseCase: resetUseCase,
      );
}