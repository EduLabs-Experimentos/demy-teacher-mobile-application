import 'package:demy_teachers/core/services/token_provider.dart';
import 'package:demy_teachers/features/auth/data/datasources/auth_local_data_source.dart';

class AuthTokenProvider implements TokenProvider {
  final AuthLocalDataSource localDataSource;

  AuthTokenProvider(this.localDataSource);

  @override
  Future<String?> getToken() async {
    return await localDataSource.getToken();
  }
}