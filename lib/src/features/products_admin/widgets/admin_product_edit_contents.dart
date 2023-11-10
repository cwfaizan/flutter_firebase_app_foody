import 'package:cwf_fudy/src/localization/string_hardcoded.dart';
import 'package:cwf_fudy/src/utils/async_value_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common_widgets/custom_message.dart';
import '../../../common_widgets/home_app_bar/action_outlined_button.dart';
import '../../../common_widgets/custom_image.dart';
import '../../../common_widgets/responsive_center.dart';
import '../../../common_widgets/responsive_two_column_layout.dart';
import '../../../constants/app_sizes.dart';
import '../../products/models/product.dart';
import '../controllers/admin_product_edit_controller.dart';
import '../services/product_validator.dart';

/// Widget containing most of the UI for editing a product
class AdminProductEditPageContents extends ConsumerStatefulWidget {
  const AdminProductEditPageContents({super.key, required this.product});
  final Product product;

  @override
  ConsumerState<AdminProductEditPageContents> createState() =>
      _AdminProductScreenContentsState();
}

class _AdminProductScreenContentsState
    extends ConsumerState<AdminProductEditPageContents> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();
  final _availableQuantityController = TextEditingController();
  Product get product => widget.product;

  @override
  void initState() {
    super.initState();
    // Initialize text fields with product data
    _titleController.text = product.title;
    _descriptionController.text = product.description;
    _priceController.text = product.price.toString();
    _availableQuantityController.text = product.availableQuantity.toString();
  }

  // Future<void> _delete() async {
  //   final delete = await showAlertDialog(
  //     context: context,
  //     title: 'Are you sure?'.hardcoded,
  //     cancelActionText: 'Cancel'.hardcoded,
  //     defaultActionText: 'Delete'.hardcoded,
  //   );
  //   if (delete == true) {
  //     ref
  //         .read(adminProductEditControllerProvider.notifier)
  //         .deleteProduct(product);
  //   }
  // }

  Future<void> _updateProduct() async {
    if (_formKey.currentState!.validate()) {
      final success = await ref
          .read(adminProductEditControllerProvider.notifier)
          .updateProduct(
            product: product,
            title: _titleController.text,
            description: _descriptionController.text,
            price: _priceController.text,
            availableQuantity: _availableQuantityController.text,
          );
      if (success) {
        // Inform the user that the product has been updated
        // ignore: use_build_context_synchronously
        showMessage(
          context,
          'Product updated'.hardcoded,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue>(
      adminProductEditControllerProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );
    final state = ref.watch(adminProductEditControllerProvider);
    final isLoading = state.isLoading;
    const autovalidateMode = AutovalidateMode.disabled;
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'.hardcoded),
        actions: [
          ActionOutlinedButton(
            text: 'Save'.hardcoded,
            onPressed: isLoading ? null : _updateProduct,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: ResponsiveCenter(
          padding: const EdgeInsets.all(Sizes.p16),
          child: Form(
            key: _formKey,
            child: ResponsiveTwoColumnLayout(
              startContent: Card(
                child: Padding(
                  padding: const EdgeInsets.all(Sizes.p16),
                  child: CustomImage(imageUrl: product.imageUrl),
                ),
              ),
              spacing: Sizes.p16,
              endContent: Card(
                child: Padding(
                  padding: const EdgeInsets.all(Sizes.p16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        controller: _titleController,
                        enabled: !isLoading,
                        decoration: InputDecoration(
                          label: Text('Title'.hardcoded),
                        ),
                        autovalidateMode: autovalidateMode,
                        validator:
                            ref.read(productValidatorProvider).titleValidator,
                      ),
                      gapH8,
                      TextFormField(
                        controller: _descriptionController,
                        enabled: !isLoading,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: InputDecoration(
                          label: Text('Description'.hardcoded),
                        ),
                        autovalidateMode: autovalidateMode,
                        validator: ref
                            .read(productValidatorProvider)
                            .descriptionValidator,
                      ),
                      gapH8,
                      TextFormField(
                        controller: _priceController,
                        enabled: !isLoading,
                        decoration: InputDecoration(
                          label: Text('Price'.hardcoded),
                        ),
                        autovalidateMode: autovalidateMode,
                        validator:
                            ref.read(productValidatorProvider).priceValidator,
                      ),
                      gapH8,
                      TextFormField(
                        controller: _availableQuantityController,
                        enabled: !isLoading,
                        decoration: InputDecoration(
                          label: Text('Available Quantity'.hardcoded),
                        ),
                        autovalidateMode: autovalidateMode,
                        validator: ref
                            .read(productValidatorProvider)
                            .availableQuantityValidator,
                      ),
                      gapH16,
                      // const Divider(),
                      // gapH8,
                      // EditProductOptions(
                      //   onLoadFromTemplate:
                      //       isLoading ? null : _loadFromTemplate,
                      //   onDelete: isLoading ? null : _delete,
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    _availableQuantityController.dispose();
    super.dispose();
  }
}
