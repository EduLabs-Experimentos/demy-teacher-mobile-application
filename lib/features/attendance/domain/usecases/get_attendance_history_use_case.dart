import 'package:dartz/dartz.dart';
import 'package:demy_teachers/core/errors/failure.dart';
import 'package:demy_teachers/core/usecases/usecase.dart';
import 'package:demy_teachers/features/attendance/domain/entities/attendance_history.dart';
import 'package:demy_teachers/features/attendance/domain/repositories/attendance_repository.dart';

class GetAttendanceHistoryUseCase implements UseCase<Either<Failure, List<AttendanceHistory>>, NoParams> {
  final AttendanceRepository repository;

  GetAttendanceHistoryUseCase(this.repository);

  @override
  Future<Either<Failure, List<AttendanceHistory>>> call(NoParams params) {
    return repository.getAttendanceHistory();
  }
}