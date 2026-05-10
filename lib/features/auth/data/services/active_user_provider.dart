import 'package:demy_teachers/features/auth/domain/entities/user.dart';
import 'package:demy_teachers/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ActiveUserProvider {
  final AuthRepository authRepository;

  ActiveUserProvider(this.authRepository);

  Future<int> getActiveTeacherId() async {
    final User? user = await authRepository.getCachedUserEntity(); 

    if (user == null) {
      throw const FormatException('No active user found in cache. Must re-authenticate.');
    }

    return user.id; 
  }
}