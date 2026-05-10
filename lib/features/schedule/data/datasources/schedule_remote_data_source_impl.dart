import 'package:demy_teachers/core/network/api_client.dart';
import 'package:demy_teachers/features/schedule/data/datasources/schedule_remote_data_source.dart';
import 'package:demy_teachers/features/schedule/data/dtos/class_session_response_dto.dart';
import 'package:demy_teachers/features/schedule/data/dtos/reschedule_request_dto.dart';
import 'package:demy_teachers/features/schedule/data/endpoints/schedule_endpoints.dart';


class ScheduleRemoteDataSourceImpl implements ScheduleRemoteDataSource {
  final ApiClient apiClient;

  ScheduleRemoteDataSourceImpl(this.apiClient);

 @override
  Future<List<ClassSessionResponseDto>> getClassSessions(int userId) async {
    final pathWithId = '${ScheduleEndpoints.getClassSessions}/$userId';

    final response = await apiClient.get<List<dynamic>>(
      pathWithId,
    );
    
    if (response.data is List) {
      final List<dynamic> jsonList = response.data!;
      return jsonList
          .map((json) => ClassSessionResponseDto.fromJson(json as Map<String, dynamic>))
          .toList();
    }
    throw Exception('Invalid response format from the API.');
  }

  @override
  Future<void> rescheduleClassSession(int classSessionId, RescheduleRequestDto request) async {
    final pathWithClassSessionId = '${ScheduleEndpoints.rescheduleClassSession}/$classSessionId';

     await apiClient.put(
      pathWithClassSessionId,
      body: request.toJson(),
    );
  }
}