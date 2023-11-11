import 'package:cwf_fudy/src/features/products/widgets/product_card.dart';
import 'package:cwf_fudy/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../common_widgets/async_value_widget.dart';
import '../../../routing/app_router.dart';
import '../../authentication/controllers/auth_controller.dart';
import '../../authentication/repositories/auth_repository.dart';
import '../repositories/products_repository.dart';

/// Shows the list of products with a search field at the top.
class ProductsListPage extends ConsumerWidget {
  const ProductsListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authRepository = ref.watch(authRepositoryProvider);
    final user = authRepository.currentUser;
    final productsList = ref.watch(streamProductsListProvider);
    print('test streamProductsListProvider');
    return Scaffold(
      appBar: AppBar(
        title: Text('Products Home'.hardcoded),
        actions: [
          if (user?.isAdmin() != null)
            IconButton(
              onPressed: () {
                context.goNamed(AppRoute.admin.name);
              },
              icon: const Icon(Icons.add_moderator),
            ),
          if (user != null) ...[
            Consumer(
              builder: (context, cRef, child) {
                final acProvider = cRef.watch(authControllerProvider);
                return IconButton(
                  onPressed: () async {
                    if (!acProvider.isLoading) {
                      await cRef
                          .read(authControllerProvider.notifier)
                          .signOut();
                    }
                  },
                  icon: acProvider.isLoading
                      ? const CircularProgressIndicator()
                      : const Icon(Icons.power_settings_new),
                );
              },
            ),
          ] else
            TextButton(
              onPressed: () => context.goNamed(AppRoute.signIn.name),
              child: const Text('Login'),
            ),
        ],
      ),
      body: AsyncValueWidget(
        value: productsList,
        data: (products) => ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) => ProductCard(
            product: products[index],
          ),
        ),
      ),
      // body: CustomScrollView(
      //   controller: _scrollController,
      //   slivers: const [
      // const ResponsiveSliverCenter(
      //   padding: EdgeInsets.all(Sizes.p16),
      //   child: ProductsSearchTextField(),
      // ),
      // SliverProductsGrid(
      //   onPressed: (context, productId) => context.goNamed(
      //     AppRoute.product.name,
      //     pathParameters: {'id': productId},
      //   ),
      // ),
      //   ],
      // ),
    );
  }
}
