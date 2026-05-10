import 'package:demy_teachers/core/network/api_client.dart';
import 'package:demy_teachers/features/auth/data/services/active_user_provider.dart';
import 'package:demy_teachers/features/profile/data/datasources/profile_remote_data_source.dart';
import 'package:demy_teachers/features/profile/data/datasources/profile_remote_data_source_impl.dart';
import 'package:demy_teachers/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:demy_teachers/features/profile/domain/repositories/profile_repository.dart';
import 'package:demy_teachers/features/profile/domain/usecases/get_current_teacher.dart';
import 'package:demy_teachers/features/profile/presentation/blocs/profile_bloc.dart';
import 'package:injectable/injectable.dart';

@module
abstract class ProfileModule {

  // DATA SOURCES
  @lazySingleton
  ProfileRemoteDataSource profileRemoteDataSource(ApiClient apiClient) =>
      ProfileRemoteDataSourceImpl(apiClient);

  // REPOSITORY
  @lazySingleton
  ProfileRepository profileRepository(
    ProfileRemoteDataSource remoteDataSource,
    ActiveUserProvider userProvider,
  ) =>
      ProfileRepositoryImpl(
        remoteDataSource,
        userProvider,
      );

  // USE CASES
  @lazySingleton
  GetCurrentTeacherUseCase getCurrentTeacherUseCase(
    ProfileRepository repository,
  ) =>
      GetCurrentTeacherUseCase(repository);

  // BLOCS
  @injectable
  ProfileBloc profileBloc(GetCurrentTeacherUseCase useCase) =>
      ProfileBloc(
        getCurrentTeacher: useCase,
      );
}