// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:demy_teachers/config/app_config.dart' as _i0;
import 'package:demy_teachers/core/network/api_client.dart' as _i552;
import 'package:demy_teachers/core/network/interceptors/auth_interceptor.dart'
    as _i811;
import 'package:demy_teachers/core/network/interceptors/language_interceptor.dart'
    as _i338;
import 'package:demy_teachers/core/network/interceptors/logging_interceptor.dart'
    as _i589;
import 'package:demy_teachers/core/network/network_info.dart' as _i316;
import 'package:demy_teachers/core/network/network_module.dart' as _i0;
import 'package:demy_teachers/core/services/token_provider.dart' as _i963;
import 'package:demy_teachers/core/storage/secure_storage.dart' as _i703;
import 'package:demy_teachers/core/storage/session_storage.dart' as _i586;
import 'package:demy_teachers/features/attendance/data/datasources/attendance_remote_data_source.dart'
    as _i750;
import 'package:demy_teachers/features/attendance/data/di/attendance_module.dart'
    as _i642;
import 'package:demy_teachers/features/attendance/domain/repositories/attendance_repository.dart'
    as _i175;
import 'package:demy_teachers/features/attendance/domain/usecases/get_attendance_history_use_case.dart'
    as _i773;
import 'package:demy_teachers/features/attendance/domain/usecases/get_students_use_case.dart'
    as _i422;
import 'package:demy_teachers/features/attendance/presentation/blocs/attendance_bloc.dart'
    as _i703;
import 'package:demy_teachers/features/attendance/presentation/blocs/attendance_report_bloc.dart'
    as _i847;
import 'package:demy_teachers/features/auth/data/datasources/auth_local_data_source.dart'
    as _i883;
import 'package:demy_teachers/features/auth/data/datasources/auth_remote_data_source.dart'
    as _i85;
import 'package:demy_teachers/features/auth/data/di/auth_module.dart' as _i75;
import 'package:demy_teachers/features/auth/data/services/active_user_provider.dart'
    as _i4;
import 'package:demy_teachers/features/auth/domain/repositories/auth_repository.dart'
    as _i604;
import 'package:demy_teachers/features/auth/domain/usecases/request_reset_password_use_case.dart'
    as _i1013;
import 'package:demy_teachers/features/auth/domain/usecases/reset_password_use_case.dart'
    as _i579;
import 'package:demy_teachers/features/auth/domain/usecases/sign_in_use_case.dart'
    as _i87;
import 'package:demy_teachers/features/auth/domain/usecases/verify_reset_code_use_case.dart'
    as _i998;
import 'package:demy_teachers/features/auth/presentation/blocs/auth_bloc.dart'
    as _i536;
import 'package:demy_teachers/features/auth/presentation/blocs/reset_password_bloc.dart'
    as _i406;
import 'package:demy_teachers/features/profile/data/datasources/profile_remote_data_source.dart'
    as _i498;
import 'package:demy_teachers/features/profile/data/di/profile_module.dart'
    as _i281;
import 'package:demy_teachers/features/profile/domain/repositories/profile_repository.dart'
    as _i43;
import 'package:demy_teachers/features/profile/domain/usecases/get_current_teacher.dart'
    as _i999;
import 'package:demy_teachers/features/profile/presentation/blocs/profile_bloc.dart'
    as _i725;
import 'package:demy_teachers/features/schedule/data/datasources/schedule_remote_data_source.dart'
    as _i353;
import 'package:demy_teachers/features/schedule/data/di/schedule_module.dart'
    as _i405;
import 'package:demy_teachers/features/schedule/domain/repositories/schedule_repository.dart'
    as _i952;
import 'package:demy_teachers/features/schedule/domain/usecases/get_schedule_for_teacher_use_case.dart'
    as _i57;
import 'package:demy_teachers/features/schedule/domain/usecases/reschedule_class_session_use_case.dart'
    as _i363;
import 'package:demy_teachers/features/schedule/presentation/blocs/reschedule_bloc.dart'
    as _i866;
import 'package:demy_teachers/features/schedule/presentation/blocs/schedule_bloc.dart'
    as _i460;
import 'package:demy_teachers/features/splash/presentation/blocs/splash_bloc.dart'
    as _i871;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final networkModule = _$NetworkModule();
    final attendanceModule = _$AttendanceModule();
    final authModule = _$AuthModule();
    final profileModule = _$ProfileModule();
    final scheduleModule = _$ScheduleModule();
    gh.factory<_i338.LanguageInterceptor>(() => _i338.LanguageInterceptor());
    gh.lazySingleton<_i0.AppConfig>(() => networkModule.appConfig());
    gh.lazySingleton<_i895.Connectivity>(() => networkModule.connectivity());
    gh.lazySingleton<_i316.NetworkInfo>(
      () => networkModule.networkInfo(gh<_i895.Connectivity>()),
    );
    gh.lazySingleton<_i361.Dio>(() => networkModule.dio(gh<_i0.AppConfig>()));
    gh.factory<_i589.LoggingInterceptor>(
      () => _i589.LoggingInterceptor(gh<_i0.AppConfig>()),
    );
    gh.lazySingleton<_i586.SessionStorage>(() => _i703.SecureStorage());
    gh.lazySingleton<_i552.ApiClient>(
      () => networkModule.apiClient(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i750.AttendanceRemoteDataSource>(
      () => attendanceModule.attendanceRemoteDataSource(gh<_i552.ApiClient>()),
    );
    gh.lazySingleton<_i85.AuthRemoteDataSource>(
      () => authModule.authRemoteDataSource(gh<_i552.ApiClient>()),
    );
    gh.lazySingleton<_i498.ProfileRemoteDataSource>(
      () => profileModule.profileRemoteDataSource(gh<_i552.ApiClient>()),
    );
    gh.lazySingleton<_i353.ScheduleRemoteDataSource>(
      () => scheduleModule.scheduleRemoteDataSource(gh<_i552.ApiClient>()),
    );
    gh.lazySingleton<_i175.AttendanceRepository>(
      () => attendanceModule.attendanceRepository(
        gh<_i750.AttendanceRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i883.AuthLocalDataSource>(
      () => authModule.authLocalDataSource(gh<_i586.SessionStorage>()),
    );
    gh.lazySingleton<_i963.TokenProvider>(
      () => authModule.tokenProvider(gh<_i883.AuthLocalDataSource>()),
    );
    gh.lazySingleton<_i604.AuthRepository>(
      () => authModule.authRepository(
        gh<_i883.AuthLocalDataSource>(),
        gh<_i85.AuthRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i422.GetStudentsUseCase>(
      () =>
          attendanceModule.getStudentsUseCase(gh<_i175.AttendanceRepository>()),
    );
    gh.lazySingleton<_i422.RegisterAttendanceUseCase>(
      () => attendanceModule.registerAttendanceUseCase(
        gh<_i175.AttendanceRepository>(),
      ),
    );
    gh.lazySingleton<_i773.GetAttendanceHistoryUseCase>(
      () => attendanceModule.getAttendanceHistoryUseCase(
        gh<_i175.AttendanceRepository>(),
      ),
    );
    gh.lazySingleton<_i87.SignInUser>(
      () => authModule.signInUser(gh<_i604.AuthRepository>()),
    );
    gh.lazySingleton<_i1013.RequestResetPasswordUseCase>(
      () => authModule.requestResetPasswordUseCase(gh<_i604.AuthRepository>()),
    );
    gh.lazySingleton<_i998.VerifyResetCodeUseCase>(
      () => authModule.verifyResetCodeUseCase(gh<_i604.AuthRepository>()),
    );
    gh.lazySingleton<_i579.ResetPasswordUseCase>(
      () => authModule.resetPasswordUseCase(gh<_i604.AuthRepository>()),
    );
    gh.factory<_i703.AttendanceBloc>(
      () => attendanceModule.attendanceBloc(
        gh<_i422.GetStudentsUseCase>(),
        gh<_i422.RegisterAttendanceUseCase>(),
      ),
    );
    gh.factory<_i871.SplashBloc>(
      () => _i871.SplashBloc(gh<_i604.AuthRepository>()),
    );
    gh.factory<_i406.ResetPasswordBloc>(
      () => authModule.resetPasswordBloc(
        gh<_i1013.RequestResetPasswordUseCase>(),
        gh<_i998.VerifyResetCodeUseCase>(),
        gh<_i579.ResetPasswordUseCase>(),
      ),
    );
    gh.factory<_i847.AttendanceReportBloc>(
      () => attendanceModule.attendanceReportBloc(
        gh<_i422.GetStudentsUseCase>(),
        gh<_i773.GetAttendanceHistoryUseCase>(),
      ),
    );
    gh.factory<_i536.AuthBloc>(
      () => authModule.authBloc(
        gh<_i87.SignInUser>(),
        gh<_i604.AuthRepository>(),
      ),
    );
    gh.lazySingleton<_i4.ActiveUserProvider>(
      () => _i4.ActiveUserProvider(gh<_i604.AuthRepository>()),
    );
    gh.factory<_i811.AuthInterceptor>(
      () => _i811.AuthInterceptor(gh<_i963.TokenProvider>()),
    );
    gh.lazySingleton<_i952.ScheduleRepository>(
      () => scheduleModule.scheduleRepository(
        gh<_i353.ScheduleRemoteDataSource>(),
        gh<_i4.ActiveUserProvider>(),
      ),
    );
    gh.lazySingleton<_i43.ProfileRepository>(
      () => profileModule.profileRepository(
        gh<_i498.ProfileRemoteDataSource>(),
        gh<_i4.ActiveUserProvider>(),
      ),
    );
    gh.lazySingleton<_i999.GetCurrentTeacherUseCase>(
      () =>
          profileModule.getCurrentTeacherUseCase(gh<_i43.ProfileRepository>()),
    );
    gh.lazySingleton<_i57.GetScheduleForTeacher>(
      () => scheduleModule.getSchedules(gh<_i952.ScheduleRepository>()),
    );
    gh.lazySingleton<_i363.RescheduleClassSession>(
      () => scheduleModule.rescheduleSession(gh<_i952.ScheduleRepository>()),
    );
    gh.factory<_i460.ScheduleBloc>(
      () => scheduleModule.scheduleBloc(gh<_i57.GetScheduleForTeacher>()),
    );
    gh.factory<_i725.ProfileBloc>(
      () => profileModule.profileBloc(gh<_i999.GetCurrentTeacherUseCase>()),
    );
    gh.factory<_i866.RescheduleBloc>(
      () => scheduleModule.rescheduleBloc(gh<_i363.RescheduleClassSession>()),
    );
    return this;
  }
}

class _$NetworkModule extends _i0.NetworkModule {}

class _$AttendanceModule extends _i642.AttendanceModule {}

class _$AuthModule extends _i75.AuthModule {}

class _$ProfileModule extends _i281.ProfileModule {}

class _$ScheduleModule extends _i405.ScheduleModule {}
