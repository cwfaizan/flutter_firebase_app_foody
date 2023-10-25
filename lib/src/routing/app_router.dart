import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../features/authentication/pages/sign_in_page.dart';
import '../features/authentication/pages/sign_up_page.dart';
import '../features/authentication/repositories/auth_repository.dart';
import '../features/not_found_page.dart';
import '../features/products/pages/products_list_page.dart';
import 'go_router_refresh_stream.dart';

enum AppRoute {
  home,
  product,
  leaveReview,
  cart,
  checkout,
  orders,
  account,
  signIn,
  signUp,
  admin,
  adminAdd,
  adminUploadProduct,
  adminEditProduct,
}

final goRouterProvider = Provider<GoRouter>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    // * redirect logic based on the authentication state
    redirect: (context, state) async {
      final user = authRepository.currentUser;
      final isLoggedIn = user != null;
      final path = state.uri.path;
      if (isLoggedIn) {
        if (path == '/signIn') {
          return '/';
        }
        if (path == '/signUp') {
          return '/';
        }
        final isAdmin = await user.isAdmin();
        // prevent non-admin users to navigate to any of the admin pages
        if (!isAdmin && path.startsWith('/admin')) {
          return '/';
        }
      } else {
        if (path == '/account' || path == '/orders') {
          return '/';
        }
        // prevent non signed-in users to navigate to any of the admin pages
        if (path.startsWith('/admin')) {
          return '/';
        }
      }
      return null;
    },
    refreshListenable: GoRouterRefreshStream(authRepository.authStateChanges()),
    routes: [
      GoRoute(
        path: '/',
        name: AppRoute.home.name,
        builder: (context, state) => const ProductsListPage(),
        routes: [
          // GoRoute(
          //   path: 'product/:id',
          //   name: AppRoute.product.name,
          //   builder: (context, state) {
          //     final productId = state.pathParameters['id']!;
          //     return ProductPage(productId: productId);
          //   },
          //   routes: [
          //     GoRoute(
          //       path: 'review',
          //       name: AppRoute.leaveReview.name,
          //       pageBuilder: (context, state) {
          //         final productId = state.pathParameters['id']!;
          //         return MaterialPage(
          //           fullscreenDialog: true,
          //           child: LeaveReviewPage(productId: productId),
          //         );
          //       },
          //     ),
          //   ],
          // ),
          // GoRoute(
          //   path: 'cart',
          //   name: AppRoute.cart.name,
          //   pageBuilder: (context, state) => const MaterialPage(
          //     fullscreenDialog: true,
          //     child: ShoppingCartScreen(),
          //   ),
          //   routes: [
          //     GoRoute(
          //       path: 'checkout',
          //       name: AppRoute.checkout.name,
          //       pageBuilder: (context, state) => const MaterialPage(
          //         fullscreenDialog: true,
          //         child: CheckoutScreen(),
          //       ),
          //     ),
          //   ],
          // ),
          // GoRoute(
          //   path: 'orders',
          //   name: AppRoute.orders.name,
          //   pageBuilder: (context, state) => const MaterialPage(
          //     fullscreenDialog: true,
          //     child: OrdersListScreen(),
          //   ),
          // ),
          // GoRoute(
          //   path: 'account',
          //   name: AppRoute.account.name,
          //   pageBuilder: (context, state) => const MaterialPage(
          //     fullscreenDialog: true,
          //     child: AccountScreen(),
          //   ),
          // ),
          GoRoute(
            path: 'signIn',
            name: AppRoute.signIn.name,
            pageBuilder: (context, state) => MaterialPage(
              fullscreenDialog: true,
              child: SignInPage(),
            ),
          ),
          GoRoute(
            path: 'signUp',
            name: AppRoute.signUp.name,
            pageBuilder: (context, state) => MaterialPage(
              fullscreenDialog: true,
              child: SignUpPage(),
            ),
          ),
          // GoRoute(
          //   path: 'admin',
          //   name: AppRoute.admin.name,
          //   pageBuilder: (context, state) => const MaterialPage(
          //     fullscreenDialog: true,
          //     child: AdminProductsScreen(),
          //   ),
          //   routes: [
          //     GoRoute(
          //       path: 'add',
          //       name: AppRoute.adminAdd.name,
          //       pageBuilder: (context, state) => const MaterialPage(
          //         fullscreenDialog: true,
          //         child: AdminProductsAddScreen(),
          //       ),
          //       routes: [
          //         GoRoute(
          //           path: ':id',
          //           name: AppRoute.adminUploadProduct.name,
          //           builder: (context, state) {
          //             final productId = state.pathParameters['id']!;
          //             return AdminProductUploadScreen(productId: productId);
          //           },
          //         ),
          //       ],
          //     ),
          //     GoRoute(
          //       path: 'edit/:id',
          //       name: AppRoute.adminEditProduct.name,
          //       pageBuilder: (context, state) {
          //         final productId = state.pathParameters['id']!;
          //         return MaterialPage(
          //           fullscreenDialog: true,
          //           child: AdminProductEditScreen(productId: productId),
          //         );
          //       },
          //     ),
          //   ],
          // ),
        ],
      ),
    ],
    errorBuilder: (context, state) => const NotFoundPage(),
  );
});
