import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/controllers/auth_controller.dart';
import '../utils/async_value_ui.dart';
import '../enums/auth_form_type.dart';

class SubmitButton extends ConsumerWidget {
  const SubmitButton({
    super.key,
    required this.email,
    required this.password,
    required this.formType,
  });
  final TextEditingController email;
  final TextEditingController password;
  final AuthFormType formType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue>(
      authControllerProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );
    final acProvider = ref.watch(authControllerProvider);

    return FilledButton(
      onPressed: () async {
        ref.read(authControllerProvider.notifier).submit(
              email: email.text,
              password: password.text,
              formType: formType,
            );
      },
      child: acProvider.isLoading
          ? const CircularProgressIndicator()
          : Text(formType == AuthFormType.signIn ? 'Sign In' : 'Sign Up'),
    );
  }
}
