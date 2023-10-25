import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../routing/app_router.dart';
import '../../../utils/notifier_mounted.dart';
import '../../products/models/product.dart';
import '../services/image_upload_service.dart';

part 'admin_product_upload_controller.g.dart';

@riverpod
class AdminProductUploadController extends _$AdminProductUploadController
    with NotifierMounted {
  @override
  FutureOr<void> build() {
    ref.onDispose(setUnmounted);
    // no-op
  }

  Future<void> upload(Product product) async {
    try {
      state = const AsyncLoading();
      // delegate product upload to the service class
      await ref.read(imageUploadServiceProvider).uploadProduct(product);
      // On success, go to the product edit page
      ref.read(goRouterProvider).goNamed(
        AppRoute.adminEditProduct.name,
        pathParameters: {'id': product.id},
      );
    } catch (e, st) {
      if (mounted) {
        state = AsyncError(e, st);
      }
    }
  }
}
