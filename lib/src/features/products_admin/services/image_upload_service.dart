import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../exceptions/app_exception.dart';
import '../../products/models/product.dart';
import '../../products/repositories/products_repository.dart';
import '../repositories/image_upload_repository.dart';

part 'image_upload_service.g.dart';

class ImageUploadService {
  const ImageUploadService(this.ref);
  final Ref ref;

  Future<void> uploadProduct(Product product) async {
    final imageUrl = product.imageUrl;
    if (imageUrl == null) {
      throw NullProductImageUrlException();
    }
    // upload to storage and return download URL
    final downloadUrl = await ref
        .read(imageUploadRepositoryProvider)
        .uploadProductImageFromAsset(imageUrl, product.id);

    // write to Cloud Firestore or update image url to CF
    await ref
        .read(productsRepositoryProvider)
        .createProduct(product.id, downloadUrl);
  }

  Future<void> deleteProduct(Product product) async {
    final imageUrl = product.imageUrl;
    if (imageUrl != null) {
      // delete image from storage
      await ref
          .read(imageUploadRepositoryProvider)
          .deleteProductImage(imageUrl);
    }

    // delete product from Firestore
    await ref.read(productsRepositoryProvider).deleteProduct(product.id);
  }
}

@riverpod
ImageUploadService imageUploadService(ImageUploadServiceRef ref) {
  return ImageUploadService(ref);
}
