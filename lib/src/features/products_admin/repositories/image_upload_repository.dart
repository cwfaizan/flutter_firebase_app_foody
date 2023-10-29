import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../products/models/product.dart';

part 'image_upload_repository.g.dart';

/// Class for uploading images to Firebase Storage
class ImageUploadRepository {
  ImageUploadRepository(this._storage);
  final FirebaseStorage _storage;

  /// Upload an image asset to Firebase Storage and returns the download URL
  Future<String> uploadProductImageFromWeb(
      Uint8List bytesFromPicker, ProductID productId) async {
    // upload to Firebase Storage
    final result = await _uploadAsset(bytesFromPicker, productId);
    // return download URL
    return result.ref.getDownloadURL();
  }

  UploadTask _uploadAsset(Uint8List byteData, String filename) {
    // final bytes = byteData.buffer
    //     .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);
    final ref = _storage.ref('products/$filename');
    return ref.putData(
      byteData,
      SettableMetadata(contentType: 'image/jpeg'),
    );
  }

  /// Delete the product image from Firebase storage
  Future<void> deleteProductImage(String imageUrl) {
    // * This line will throw an exception when running with the Firebase local emulator.
    // * 'parts != null': url could not be parsed, ensure it's a valid storage url
    // * More info here: https://github.com/firebase/flutterfire/issues/7019
    return _storage.refFromURL(imageUrl).delete();
  }
}

@riverpod
ImageUploadRepository imageUploadRepository(ImageUploadRepositoryRef ref) {
  return ImageUploadRepository(FirebaseStorage.instance);
}
