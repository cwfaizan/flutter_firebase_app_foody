import 'package:cwf_fudy/src/common_widgets/custom_image.dart';
import 'package:cwf_fudy/src/features/products/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AdminProductCard extends StatelessWidget {
  const AdminProductCard({
    super.key,
    required this.product,
    required this.delete,
    required this.ref,
  });
  final Product product;
  final Function delete;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    print('test AdminProductCard');
    return Card(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.edit),
              ),
              IconButton(
                onPressed: () {
                  delete(context, ref, product);
                },
                icon: const Icon(Icons.delete),
              ),
            ],
          ),
          CustomImage(imageUrl: product.imageUrl),
          Text(product.title),
        ],
      ),
    );
  }
}
