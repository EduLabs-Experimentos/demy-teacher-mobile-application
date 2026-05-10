import 'package:demy_teachers/core/storage/session_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: SessionStorage)
class SecureStorage implements SessionStorage {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  @override
  Future<void> save(String key, String value) async =>
      await _storage.write(key: key, value: value);

  @override
  Future<String?> read(String key) async =>
      await _storage.read(key: key);

  @override
  Future<void> delete(String key) async =>
      await _storage.delete(key: key);
}