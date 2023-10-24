import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../enums/auth_form_type.dart';
import '../routing/app_router.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/submit_button.dart';

class SignUpPage extends ConsumerWidget {
  SignUpPage({super.key});
  final emailController =
      TextEditingController(text: 'faizan.abbas020@gmail.com');
  final passwordController = TextEditingController(text: '12345678');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: customAppBar('Sign Up'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
            ),
            TextFormField(
              controller: passwordController,
              obscureText: true,
            ),
            SubmitButton(
              email: emailController,
              password: passwordController,
              formType: AuthFormType.register,
            ),
            TextButton(
              onPressed: () {
                context.goNamed(AppRoute.signInPage.name);
              },
              child: const Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}
