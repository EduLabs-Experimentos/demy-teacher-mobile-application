import 'package:demy_teachers/core/constants/api_constants.dart';

class AuthEndpoints {
  static const String _authBase = ApiConstants.authEndpointPath;

  static const String signIn = '$_authBase/sign-in';
  static const String signUp = '$_authBase/sign-up';
  static const String requestResetPassword = '$_authBase/request-reset-password';
  static const String verifyResetCode = '$_authBase/verify-reset-code';
  static const String resetPassword = '$_authBase/reset-password';
}