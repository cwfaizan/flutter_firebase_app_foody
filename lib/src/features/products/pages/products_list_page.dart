import 'package:cwf_fudy/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';

class ProductsListPage extends StatelessWidget {
  const ProductsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products Home'.hardcoded),
      ),
    );
  }
}
