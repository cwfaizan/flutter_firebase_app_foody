import 'package:cwf_fudy/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';

class AdminProductsAddPage extends StatelessWidget {
  const AdminProductsAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product'.hardcoded),
      ),
    );
  }
}
