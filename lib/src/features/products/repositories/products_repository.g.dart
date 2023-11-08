// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$productsRepositoryHash() =>
    r'0a1f6bbc8eb22fae9fa63ea9bb9506f45e1f4d4a';

/// See also [productsRepository].
@ProviderFor(productsRepository)
final productsRepositoryProvider = Provider<ProductsRepository>.internal(
  productsRepository,
  name: r'productsRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$productsRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ProductsRepositoryRef = ProviderRef<ProductsRepository>;
String _$productsListStreamHash() =>
    r'6ce4881c188ad3ff4e1f795150e00decd5aa2fa0';

/// See also [productsListStream].
@ProviderFor(productsListStream)
final productsListStreamProvider =
    AutoDisposeStreamProvider<List<Product>>.internal(
  productsListStream,
  name: r'productsListStreamProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$productsListStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ProductsListStreamRef = AutoDisposeStreamProviderRef<List<Product>>;
String _$productsListFutureHash() =>
    r'8f018bf574c889710ce2ba492782d7bb421cfbed';

/// See also [productsListFuture].
@ProviderFor(productsListFuture)
final productsListFutureProvider =
    AutoDisposeFutureProvider<List<Product>>.internal(
  productsListFuture,
  name: r'productsListFutureProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$productsListFutureHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ProductsListFutureRef = AutoDisposeFutureProviderRef<List<Product>>;
String _$productStreamHash() => r'ca05835175ed8380c860c10fae540144f62093d5';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [productStream].
@ProviderFor(productStream)
const productStreamProvider = ProductStreamFamily();

/// See also [productStream].
class ProductStreamFamily extends Family<AsyncValue<Product?>> {
  /// See also [productStream].
  const ProductStreamFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'productStreamProvider';

  /// See also [productStream].
  ProductStreamProvider call(
    ProductID id,
  ) {
    return ProductStreamProvider(
      id,
    );
  }

  @visibleForOverriding
  @override
  ProductStreamProvider getProviderOverride(
    covariant ProductStreamProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      Stream<Product?> Function(ProductStreamRef ref) create) {
    return _$ProductStreamFamilyOverride(this, create);
  }
}

class _$ProductStreamFamilyOverride
    implements FamilyOverride<AsyncValue<Product?>> {
  _$ProductStreamFamilyOverride(this.overriddenFamily, this.create);

  final Stream<Product?> Function(ProductStreamRef ref) create;

  @override
  final ProductStreamFamily overriddenFamily;

  @override
  ProductStreamProvider getProviderOverride(
    covariant ProductStreamProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [productStream].
class ProductStreamProvider extends AutoDisposeStreamProvider<Product?> {
  /// See also [productStream].
  ProductStreamProvider(
    ProductID id,
  ) : this._internal(
          (ref) => productStream(
            ref as ProductStreamRef,
            id,
          ),
          from: productStreamProvider,
          name: r'productStreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$productStreamHash,
          dependencies: ProductStreamFamily._dependencies,
          allTransitiveDependencies:
              ProductStreamFamily._allTransitiveDependencies,
          id: id,
        );

  ProductStreamProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final ProductID id;

  @override
  Override overrideWith(
    Stream<Product?> Function(ProductStreamRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ProductStreamProvider._internal(
        (ref) => create(ref as ProductStreamRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  (ProductID,) get argument {
    return (id,);
  }

  @override
  AutoDisposeStreamProviderElement<Product?> createElement() {
    return _ProductStreamProviderElement(this);
  }

  ProductStreamProvider _copyWith(
    Stream<Product?> Function(ProductStreamRef ref) create,
  ) {
    return ProductStreamProvider._internal(
      (ref) => create(ref as ProductStreamRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      id: id,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ProductStreamProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ProductStreamRef on AutoDisposeStreamProviderRef<Product?> {
  /// The parameter `id` of this provider.
  ProductID get id;
}

class _ProductStreamProviderElement
    extends AutoDisposeStreamProviderElement<Product?> with ProductStreamRef {
  _ProductStreamProviderElement(super.provider);

  @override
  ProductID get id => (origin as ProductStreamProvider).id;
}

String _$productFutureHash() => r'882ff9553d805c3f9d5e6cc7666d3201ca4d3403';

/// See also [productFuture].
@ProviderFor(productFuture)
const productFutureProvider = ProductFutureFamily();

/// See also [productFuture].
class ProductFutureFamily extends Family<AsyncValue<Product?>> {
  /// See also [productFuture].
  const ProductFutureFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'productFutureProvider';

  /// See also [productFuture].
  ProductFutureProvider call(
    ProductID id,
  ) {
    return ProductFutureProvider(
      id,
    );
  }

  @visibleForOverriding
  @override
  ProductFutureProvider getProviderOverride(
    covariant ProductFutureProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      FutureOr<Product?> Function(ProductFutureRef ref) create) {
    return _$ProductFutureFamilyOverride(this, create);
  }
}

class _$ProductFutureFamilyOverride
    implements FamilyOverride<AsyncValue<Product?>> {
  _$ProductFutureFamilyOverride(this.overriddenFamily, this.create);

  final FutureOr<Product?> Function(ProductFutureRef ref) create;

  @override
  final ProductFutureFamily overriddenFamily;

  @override
  ProductFutureProvider getProviderOverride(
    covariant ProductFutureProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [productFuture].
class ProductFutureProvider extends AutoDisposeFutureProvider<Product?> {
  /// See also [productFuture].
  ProductFutureProvider(
    ProductID id,
  ) : this._internal(
          (ref) => productFuture(
            ref as ProductFutureRef,
            id,
          ),
          from: productFutureProvider,
          name: r'productFutureProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$productFutureHash,
          dependencies: ProductFutureFamily._dependencies,
          allTransitiveDependencies:
              ProductFutureFamily._allTransitiveDependencies,
          id: id,
        );

  ProductFutureProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final ProductID id;

  @override
  Override overrideWith(
    FutureOr<Product?> Function(ProductFutureRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ProductFutureProvider._internal(
        (ref) => create(ref as ProductFutureRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  (ProductID,) get argument {
    return (id,);
  }

  @override
  AutoDisposeFutureProviderElement<Product?> createElement() {
    return _ProductFutureProviderElement(this);
  }

  ProductFutureProvider _copyWith(
    FutureOr<Product?> Function(ProductFutureRef ref) create,
  ) {
    return ProductFutureProvider._internal(
      (ref) => create(ref as ProductFutureRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      id: id,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ProductFutureProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ProductFutureRef on AutoDisposeFutureProviderRef<Product?> {
  /// The parameter `id` of this provider.
  ProductID get id;
}

class _ProductFutureProviderElement
    extends AutoDisposeFutureProviderElement<Product?> with ProductFutureRef {
  _ProductFutureProviderElement(super.provider);

  @override
  ProductID get id => (origin as ProductFutureProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
