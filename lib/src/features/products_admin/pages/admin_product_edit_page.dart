import 'package:cwf_fudy/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common_widgets/error_message_widget.dart';
import '../../products/models/product.dart';
import '../../products/repositories/products_repository.dart';
import '../widgets/admin_product_edit_contents.dart';

/// Widget screen for updating existing products (edit mode).
/// Products are first created inside [AdminProductUploadPage].
class AdminProductEditPage extends ConsumerWidget {
  const AdminProductEditPage({super.key, required this.productId});
  final ProductID productId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // * By watching a [FutureProvider], the data is only loaded once.
    // * This prevents unintended rebuilds while the user is entering form data
    final productValue = ref.watch(futureProductProvider(productId));
    // * Using .when rather than [AsyncValueWidget] to provide custom error and
    // * loading screens
    return productValue.when(
      data: (product) => product != null
          ? AdminProductEditPageContents(product: product)
          : Scaffold(
              appBar: AppBar(title: Text('Edit Product'.hardcoded)),
              body: Center(
                child: ErrorMessageWidget('Product not found'.hardcoded),
              ),
            ),
      // * to prevent a black screen, return a [Scaffold] from the error and
      // * loading screens
      error: (e, st) =>
          Scaffold(body: Center(child: ErrorMessageWidget(e.toString()))),
      loading: () =>
          const Scaffold(body: Center(child: CircularProgressIndicator())),
    );
  }
}
