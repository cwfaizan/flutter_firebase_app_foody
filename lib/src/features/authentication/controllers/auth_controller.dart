import 'package:cwf_fudy/src/features/authentication/services/auth_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../enums/auth_form_type.dart';
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
    final authService = ref.read(authServiceProvider);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
        () => authService.authenticate(email, password, formType));
    // return state.hasError == false;
  }

  Future<void> signOut() async {
    final authRepository = ref.read(authRepositoryProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => authRepository.signOut());
  }
}
