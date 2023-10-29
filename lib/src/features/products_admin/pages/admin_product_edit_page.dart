import 'package:cwf_fudy/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';

import '../../products/models/product.dart';

class AdminProductEditPage extends StatelessWidget {
  const AdminProductEditPage({super.key, required this.productId});
  final ProductID productId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'.hardcoded),
      ),
    );
  }
}
