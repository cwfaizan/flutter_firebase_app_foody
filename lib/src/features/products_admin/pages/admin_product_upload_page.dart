import 'package:cwf_fudy/src/utils/async_value_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common_widgets/primary_button.dart';
import '../../../localization/string_hardcoded.dart';
import '../../products/models/product.dart';
import '../controllers/admin_product_upload_controller.dart';

/// Used to upload a product to cloud storage
class AdminProductUploadPage extends ConsumerWidget {
  const AdminProductUploadPage({super.key, required this.productId});
  final ProductID productId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue>(
      adminProductUploadControllerProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );
    // State of the upload operation
    final state = ref.watch(adminProductUploadControllerProvider);
    final isLoading = state.isLoading;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Product'),
      ),
      body: Center(
        child: PrimaryButton(
          text: 'Upload Product Image'.hardcoded,
          isLoading: isLoading,
          onPressed: isLoading
              ? null
              : () => ref
                  .read(adminProductUploadControllerProvider.notifier)
                  .upload(productId),
        ),
      ),
    );
  }
}
