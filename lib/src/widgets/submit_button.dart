import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../utils/async_value_ui.dart';
import '../controllers/auth_controller.dart';
import '../enums/auth_form_type.dart';

// ignore: must_be_immutable
class SubmitButton extends ConsumerWidget {
  SubmitButton({
    super.key,
    required this.email,
    required this.password,
    required this.formType,
  });
  String email;
  String password;
  AuthFormType formType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue>(
      authControllerProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );
    final acProvider = ref.watch(authControllerProvider);
    print('object acProvider 2 $email');

    return FilledButton(
      onPressed: () async {
        ref.read(authControllerProvider.notifier).submit(
              email: email,
              password: password,
              formType: formType,
            );
      },
      child: acProvider.isLoading
          ? const CircularProgressIndicator()
          : Text(formType == AuthFormType.signIn ? 'Sign In' : 'Sign Up'),
    );
  }
}
