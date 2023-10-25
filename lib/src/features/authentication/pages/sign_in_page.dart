import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../enums/auth_form_type.dart';
import '../../../routing/app_router.dart';
import '../widgets/submit_button.dart';

// ignore: must_be_immutable
class SignInPage extends StatelessWidget {
  SignInPage({super.key});
  final emailController =
      TextEditingController(text: 'faizan.abbas020@gmail.com');
  final passwordController = TextEditingController(text: '12345678');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign In')),
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
              formType: AuthFormType.signIn,
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.sendPasswordResetEmail(
                      email: emailController.text,
                    );
                  },
                  child: const Text('Password Reset'),
                ),
                TextButton(
                  onPressed: () {
                    context.goNamed(AppRoute.signUp.name);
                  },
                  child: const Text('Sign Up'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
