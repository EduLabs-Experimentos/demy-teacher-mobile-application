import 'package:demy_teachers/core/storage/session_storage.dart';
import 'package:demy_teachers/features/auth/data/datasources/auth_local_data_source.dart';

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SessionStorage storage;

  AuthLocalDataSourceImpl(this.storage);

  static const _tokenKey = 'auth_token';
  static const _userIdKey = 'user_id';
  static const _userEmailKey = 'user_email';

  @override
  Future<void> saveToken(String token) async =>
      await storage.save(_tokenKey, token);

  @override
  Future<String?> getToken() async =>
      await storage.read(_tokenKey);

  @override
  Future<void> clearToken() async =>
      await storage.delete(_tokenKey);

  @override
  Future<void> saveUser({required int id, required String email}) async {
    await storage.save(_userIdKey, id.toString());
    await storage.save(_userEmailKey, email);
  }

  @override
  Future<Map<String, String?>> getUser() async {
    final id = await storage.read(_userIdKey);
    final email = await storage.read(_userEmailKey);
    return {
      'id': id,
      'email': email,
    };
  }

  @override
  Future<void> clearUser() async {
    await storage.delete(_userIdKey);
    await storage.delete(_userEmailKey);
  }
}