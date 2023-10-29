import 'package:cwf_fudy/src/localization/string_hardcoded.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../routing/app_router.dart';
import '../../../utils/unique_pid.dart';
import '../../products/models/product.dart';

class AdminProductsPage extends ConsumerWidget {
  const AdminProductsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ProductID productId = ref.watch(uuidProvider).v4();
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Products'.hardcoded),
        actions: [
          IconButton(
            onPressed: () {
              context.goNamed(
                AppRoute.adminUploadProduct.name,
                pathParameters: {'id': productId},
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Center(
        child:
            Text(FirebaseAuth.instance.currentUser?.email ?? 'No User Login'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => context.goNamed(AppRoute.adminAdd.name),
      ),
    );
  }
}
