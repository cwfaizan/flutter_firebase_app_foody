import 'package:flutter/material.dart';

import '../../../common_widgets/responsive_center.dart';
import '../../../localization/string_hardcoded.dart';
import '../../../constants/breakpoints.dart';
import '../../products/models/product.dart';
import '../widgets/admin_product_upload.dart';

/// Used to upload a product to cloud storage
class AdminProductUploadPage extends StatelessWidget {
  const AdminProductUploadPage({super.key, required this.productId});
  final ProductID productId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload a product'.hardcoded),
      ),
      body: ResponsiveCenter(
        maxContentWidth: Breakpoint.tablet,
        child: AdminProductUpload(productId: productId),
      ),
    );
  }
}
