import 'package:cwf_fudy/src/features/products/models/product.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    print('test ProductCard');
    return Card(
      child: Column(
        children: [
          Text(product.id),
          Text(product.title),
          Text(product.description),
          Text(product.imageUrl ?? 'No Image'),
        ],
      ),
    );
  }
}
