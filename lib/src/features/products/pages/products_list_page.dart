import 'package:cwf_fudy/src/features/products/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common_widgets/async_value_widget.dart';
import '../../../common_widgets/home_app_bar/home_app_bar.dart';
import '../repositories/products_repository.dart';

/// Shows the list of products with a search field at the top.
class ProductsListPage extends ConsumerStatefulWidget {
  const ProductsListPage({super.key});

  @override
  ConsumerState<ProductsListPage> createState() => _ProductsListPageState();
}

class _ProductsListPageState extends ConsumerState<ProductsListPage> {
  // * Use a [ScrollController] to register a listener that dismisses the
  // * on-screen keyboard when the user scrolls.
  // * This is needed because this page has a search field that the user can
  // * type into.
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_dismissOnScreenKeyboard);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_dismissOnScreenKeyboard);
    super.dispose();
  }

  // When the search text field gets the focus, the keyboard appears on mobile.
  // This method is used to dismiss the keyboard when the user scrolls.
  void _dismissOnScreenKeyboard() {
    if (FocusScope.of(context).hasFocus) {
      FocusScope.of(context).unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    // final authRepository = ref.watch(authRepositoryProvider);
    // final user = authRepository.currentUser;
    final productsList = ref.watch(streamProductsListProvider);
    print('test streamProductsListProvider');
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Products Home'.hardcoded),
      //   actions: [
      //     if (user?.email == 'faizan.abbas020@gmail.com')
      //       IconButton(
      //         onPressed: () {
      //           context.goNamed(AppRoute.admin.name);
      //         },
      //         icon: const Icon(Icons.add_moderator),
      //       ),
      //     if (user != null) ...[
      //       Consumer(
      //         builder: (context, cRef, child) {
      //           final acProvider = cRef.watch(authControllerProvider);
      //           return IconButton(
      //             onPressed: () async {
      //               if (!acProvider.isLoading) {
      //                 await cRef
      //                     .read(authControllerProvider.notifier)
      //                     .signOut();
      //               }
      //             },
      //             icon: acProvider.isLoading
      //                 ? const CircularProgressIndicator()
      //                 : const Icon(Icons.power_settings_new),
      //           );
      //         },
      //       ),
      //     ] else
      //       IconButton(
      //         onPressed: () => context.goNamed(AppRoute.signIn.name),
      //         icon: const Icon(Icons.power_settings_new),
      //       ),
      //   ],
      // ),
      appBar: const HomeAppBar(),
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
