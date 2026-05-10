import 'package:dartz/dartz.dart';
import 'package:demy_teachers/core/errors/failure.dart';
import 'package:demy_teachers/core/utils/safe_call.dart';
import 'package:demy_teachers/features/auth/data/services/active_user_provider.dart';
import 'package:demy_teachers/features/profile/data/datasources/profile_remote_data_source.dart';
import 'package:demy_teachers/features/profile/domain/entities/teacher.dart';
import 'package:demy_teachers/features/profile/data/mappers/profile_mapper.dart';
import 'package:demy_teachers/features/profile/domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource remoteDataSource;
  final ActiveUserProvider userProvider;

  ProfileRepositoryImpl(
    this.remoteDataSource,
    this.userProvider,
  );

  @override
  Future<Either<Failure, Teacher>> getCurrentTeacher() async {
    return safeCall(() async {
      
      // (Opcionalmente podrías enviarlo si tu API espera un id más adelante)

      final dto = await remoteDataSource.getCurrentTeacher();
      final entity = ProfileMapper.fromDto(dto);

      return entity;
    });
  }
}