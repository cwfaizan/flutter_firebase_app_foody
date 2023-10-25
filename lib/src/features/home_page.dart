import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'authentication/controllers/auth_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          Consumer(
            builder: (context, cRef, child) {
              final acProvider = cRef.watch(authControllerProvider);
              return IconButton(
                onPressed: () async {
                  if (!acProvider.isLoading) {
                    await cRef.read(authControllerProvider.notifier).signOut();
                  }
                },
                icon: acProvider.isLoading
                    ? const CircularProgressIndicator()
                    : const Icon(Icons.power_settings_new),
              );
            },
          ),
        ],
      ),
      body: const Column(
        children: [
          Text('data'),
        ],
      ),
    );
  }
}
