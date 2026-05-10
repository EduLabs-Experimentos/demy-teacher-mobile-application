import 'package:demy_teachers/core/network/api_client.dart';
import 'package:demy_teachers/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:demy_teachers/features/auth/data/dtos/request_reset_password_dto.dart';
import 'package:demy_teachers/features/auth/data/dtos/reset_password_dto.dart';
import 'package:demy_teachers/features/auth/data/dtos/sign_in_request_dto.dart';
import 'package:demy_teachers/features/auth/data/dtos/sign_in_response_dto.dart';
import 'package:demy_teachers/features/auth/data/dtos/verify_reset_code_dto.dart';
import 'package:demy_teachers/features/auth/data/endpoints/auth_endpoints.dart';
import 'package:demy_teachers/features/auth/data/mappers/user_mapper.dart';
import 'package:demy_teachers/features/auth/domain/entities/user.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource{
  final ApiClient apiClient;

  AuthRemoteDataSourceImpl(this.apiClient);

  @override
  Future<User> signIn(String email, String password) async {
    final request = SignInRequestDto(email: email, password: password);
    final response = await apiClient.post(AuthEndpoints.signIn, body: request.toJson());
    final dto = SignInResponseDto.fromJson(response.data);
    return UserMapper.fromDto(dto);
  }

  @override
  Future<void> requestResetPassword(String emailAddress) async {
    final request = RequestResetPasswordDto(emailAddress: emailAddress);
    await apiClient.post(AuthEndpoints.requestResetPassword, body: request.toJson());
  }

  @override
  Future<void> verifyResetCode(String emailAddress, String code) async {
    final request = VerifyResetCodeDto(emailAddress: emailAddress, code: code);
    await apiClient.post(AuthEndpoints.verifyResetCode, body: request.toJson());
  }

  @override
  Future<User> resetPassword(String emailAddress, String password, String confirmPassword) async {
    final request = ResetPasswordDto(
      emailAddress: emailAddress,
      password: password,
      confirmPassword: confirmPassword,
    );
    final response = await apiClient.post(AuthEndpoints.resetPassword, body: request.toJson());
    
    if (response.data is Map<String, dynamic>) {
      final dto = ResetPasswordResponseDto.fromJson(response.data!);
      return User(
        id: dto.id,
        email: dto.emailAddress,
        token: dto.token,
      );
    }

    throw Exception('Invalid response format from API.');
  }
}