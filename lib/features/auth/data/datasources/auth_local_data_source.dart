abstract class AuthLocalDataSource {
  Future<void> saveToken(String token);

  Future<String?> getToken();
  
  Future<void> clearToken();

  Future<void> saveUser({required int id, required String email});

  Future<Map<String, String?>> getUser();
  
  Future<void> clearUser();
}