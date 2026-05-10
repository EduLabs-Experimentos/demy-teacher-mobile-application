import 'package:demy_teachers/core/network/api_client.dart';
import 'package:demy_teachers/features/profile/data/datasources/profile_remote_data_source.dart';
import 'package:demy_teachers/features/profile/data/dtos/teacher_response_dto.dart';
import 'package:demy_teachers/features/profile/data/endpoints/profile_endpoints.dart';

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final ApiClient apiClient;

  ProfileRemoteDataSourceImpl(this.apiClient);

  @override
  Future<TeacherResponseDto> getCurrentTeacher() async {
    final response = await apiClient.get<Map<String, dynamic>>(
      ProfileEndpoints.getCurrentTeacher,
    );

    if (response.data is Map<String, dynamic>) {
      return TeacherResponseDto.fromJson(response.data!);
    }

    throw Exception('Invalid response format from API.');
  }
}