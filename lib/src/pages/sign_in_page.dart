import 'package:cwf_fudy/src/widgets/submit_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../enums/auth_form_type.dart';
import '../routing/app_router.dart';
import '../widgets/custom_app_bar.dart';

// ignore: must_be_immutable
class SignInPage extends StatelessWidget {
  SignInPage({super.key});
  TextEditingController emailController = TextEditingController();
  // TextEditingController(text: 'faizan.abbas020@gmail.com');
  TextEditingController passwordController = TextEditingController();
  // TextEditingController(text: '12345678');

  @override
  Widget build(BuildContext context) {
    print('object acProvider 1');
    return Scaffold(
      appBar: customAppBar('Sign In'),
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
              email: emailController.text,
              password: passwordController.text,
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
                    context.goNamed(AppRoute.signUpPage.name);
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
