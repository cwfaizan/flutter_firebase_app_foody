import 'package:cwf_fudy/src/localization/string_hardcoded.dart';
import 'package:cwf_fudy/src/utils/async_value_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../common_widgets/alert_dialogs.dart';
import '../../../common_widgets/async_value_widget.dart';
import '../../../routing/app_router.dart';
import '../../../utils/unique_pid.dart';
import '../../products/models/product.dart';
import '../../products/repositories/products_repository.dart';
import '../controllers/admin_product_edit_controller.dart';
import '../widgets/admin_product_card.dart';

class AdminProductsPage extends ConsumerWidget {
  const AdminProductsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue>(
      adminProductEditControllerProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );
    // final state = ref.watch(adminProductEditControllerProvider);
    // final isLoading = state.isLoading;
    final productsList = ref.watch(streamProductsListProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Products'.hardcoded),
      ),
      body: AsyncValueWidget(
        value: productsList,
        data: (products) => ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) => AdminProductCard(
            product: products[index],
            delete: _delete,
            ref: ref,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          final ProductID productId = ref.read(uuidProvider).v4();
          context.goNamed(
            AppRoute.adminUploadProduct.name,
            pathParameters: {'id': productId},
          );
        },
      ),
    );
  }

  Future<void> _delete(
      BuildContext context, WidgetRef ref, Product product) async {
    final delete = await showAlertDialog(
      context: context,
      title: 'Are you sure?'.hardcoded,
      cancelActionText: 'Cancel'.hardcoded,
      defaultActionText: 'Delete'.hardcoded,
    );
    if (delete == true) {
      ref
          .read(adminProductEditControllerProvider.notifier)
          .deleteProduct(product);
    }
  }
}
