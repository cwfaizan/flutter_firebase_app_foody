import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/async_value_ui.dart';
import '../../../localization/string_hardcoded.dart';
import '../../../common_widgets/primary_button.dart';
import '../../../constants/app_sizes.dart';
import '../../products/models/product.dart';
import '../controllers/admin_product_upload_controller.dart';

class AdminProductUpload extends ConsumerWidget {
  const AdminProductUpload({super.key, required this.productId});
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
    // Product to be uploaded
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(Sizes.p16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            // if (product != null) ...[
            // CustomImage(imageUrl: product.imageUrl),
            gapH16,
            PrimaryButton(
              text: 'Upload Product Image'.hardcoded,
              isLoading: isLoading,
              onPressed: isLoading
                  ? null
                  : () => ref
                      .read(adminProductUploadControllerProvider.notifier)
                      .upload(productId),
            ),
            // ] else
            //   ErrorMessageWidget(
            //     'Product template not found for ID: $productId',
            //   ),
          ],
        ),
      ),
    );
  }
}
