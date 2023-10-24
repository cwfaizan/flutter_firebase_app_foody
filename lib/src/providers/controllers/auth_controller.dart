import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../enums/auth_form_type.dart';
import '../repositories/auth_repository.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  FutureOr<void> build() {}

  Future<void> submit({
    required String email,
    required String password,
    required AuthFormType formType,
  }) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() {
      final authRepository = ref.read(authRepositoryProvider);
      switch (formType) {
        case AuthFormType.signIn:
          return authRepository.signInWithEmailAndPassword(email, password);
        case AuthFormType.register:
          return authRepository.createUserWithEmailAndPassword(email, password);
      }
    });
    // return state.hasError == false;
  }

  // Future<void> _authenticate(
  //     String email, String password, AuthFormType formType) {
  //   final authRepository = ref.read(authRepositoryProvider);
  //   switch (formType) {
  //     case AuthFormType.signIn:
  //       return authRepository.signInWithEmailAndPassword(email, password);
  //     case AuthFormType.register:
  //       return authRepository.createUserWithEmailAndPassword(email, password);
  //   }
  // }
}
