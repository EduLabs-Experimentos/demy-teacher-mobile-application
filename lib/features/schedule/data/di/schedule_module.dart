import 'package:demy_teachers/core/network/api_client.dart';
import 'package:demy_teachers/features/auth/data/services/active_user_provider.dart';
import 'package:demy_teachers/features/schedule/data/datasources/schedule_remote_data_source.dart';
import 'package:demy_teachers/features/schedule/data/datasources/schedule_remote_data_source_impl.dart';
import 'package:demy_teachers/features/schedule/data/repositories/schedule_repository_impl.dart';
import 'package:demy_teachers/features/schedule/domain/repositories/schedule_repository.dart';
import 'package:demy_teachers/features/schedule/domain/usecases/get_schedule_for_teacher_use_case.dart';
import 'package:demy_teachers/features/schedule/domain/usecases/reschedule_class_session_use_case.dart';
import 'package:demy_teachers/features/schedule/presentation/blocs/reschedule_bloc.dart';
import 'package:demy_teachers/features/schedule/presentation/blocs/schedule_bloc.dart';
import 'package:injectable/injectable.dart';

@module
abstract class ScheduleModule {

  @lazySingleton
  ScheduleRemoteDataSource scheduleRemoteDataSource(ApiClient apiClient) =>
      ScheduleRemoteDataSourceImpl(apiClient);

  @lazySingleton
  ScheduleRepository scheduleRepository(
          ScheduleRemoteDataSource remoteDataSource, 
          ActiveUserProvider userProvider,
          ) =>
      ScheduleRepositoryImpl(
        remoteDataSource, 
        userProvider,
      );
  
  @lazySingleton
  GetScheduleForTeacher getSchedules(ScheduleRepository repository) => 
      GetScheduleForTeacher(repository);

  @lazySingleton
  RescheduleClassSession rescheduleSession(ScheduleRepository repository) => 
    RescheduleClassSession(repository);

  @injectable
  ScheduleBloc scheduleBloc(GetScheduleForTeacher getScheduleForTeacher) => ScheduleBloc(getScheduleForTeacher);

  @injectable
  RescheduleBloc rescheduleBloc(RescheduleClassSession useCase) => 
      RescheduleBloc(useCase);
}