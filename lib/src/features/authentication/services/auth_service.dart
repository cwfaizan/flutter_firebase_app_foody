import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../enums/auth_form_type.dart';
import '../repositories/auth_repository.dart';

part 'auth_service.g.dart';

class AuthService {
  const AuthService(this.ref);
  final Ref ref;

  Future<void> authenticate(
      String email, String password, AuthFormType formType) async {
    final authRepository = ref.read(authRepositoryProvider);
    switch (formType) {
      case AuthFormType.signIn:
        return authRepository.signInWithEmailAndPassword(email, password);
      case AuthFormType.register:
        await authRepository.createUserWithEmailAndPassword(email, password);
        return authRepository.currentUser?.sendEmailVerification();
    }
  }
}

@riverpod
AuthService authService(AuthServiceRef ref) {
  return AuthService(ref);
}
