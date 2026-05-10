import 'package:demy_teachers/core/network/api_client.dart';
import 'package:demy_teachers/features/attendance/data/dtos/create_attendance_request_dto.dart';
import 'package:demy_teachers/features/attendance/data/dtos/student_response_dto.dart';
import 'package:demy_teachers/features/attendance/data/endpoints/attendance_endpoints.dart';
import 'package:demy_teachers/features/attendance/data/dtos/attendance_history_response_dto.dart';

abstract class AttendanceRemoteDataSource {
  Future<List<StudentResponseDto>> getStudents(int classSessionId);
  Future<void> registerAttendance(CreateAttendanceRequestDto request);
  Future<List<AttendanceHistoryDto>> getAttendanceHistory();
  
}

class AttendanceRemoteDataSourceImpl implements AttendanceRemoteDataSource {
  final ApiClient apiClient;

  AttendanceRemoteDataSourceImpl(this.apiClient);

  @override
  Future<List<StudentResponseDto>> getStudents(int classSessionId) async {
    final response = await apiClient.get<List<dynamic>>(AttendanceEndpoints.getStudents);
    
    if (response.data is List) {
       return response.data!
          .map((json) => StudentResponseDto.fromJson(json))
          .toList();
    }
    throw Exception('Invalid format');
  }

  @override
  Future<void> registerAttendance(CreateAttendanceRequestDto request) async {
    await apiClient.post(
      AttendanceEndpoints.createAttendance,
      body: request.toJson(),
    );
  }

  @override
Future<List<AttendanceHistoryDto>> getAttendanceHistory() async {
  final response = await apiClient.get<List<dynamic>>('/class-attendances/all');
  return response.data!.map((e) => AttendanceHistoryDto.fromJson(e)).toList();
}
}