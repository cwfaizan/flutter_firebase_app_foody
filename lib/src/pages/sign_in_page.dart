import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../routing/app_router.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_message.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Sign In'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController..text = 'faizan.abbas020@gmail.com',
            ),
            TextFormField(
              controller: passwordController..text = '12345678',
              obscureText: true,
            ),
            FilledButton(
              onPressed: () {
                signInWithEmailAndPassword(context);
              },
              child: const Text('Sign In'),
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

  Future<void> signInWithEmailAndPassword(BuildContext context) async {
    try {
      // ignore: unused_local_variable
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // ignore: use_build_context_synchronously
        showMessage(context, 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        // ignore: use_build_context_synchronously
        showMessage(context, 'Wrong password provided for that user.');
      }
    }
  }
}
