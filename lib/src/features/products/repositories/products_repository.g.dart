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
String _$streamProductsListHash() =>
    r'086224a39e9fb65379ea9b31bd357a2564e9afcd';

/// See also [streamProductsList].
@ProviderFor(streamProductsList)
final streamProductsListProvider =
    AutoDisposeStreamProvider<List<Product>>.internal(
  streamProductsList,
  name: r'streamProductsListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$streamProductsListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef StreamProductsListRef = AutoDisposeStreamProviderRef<List<Product>>;
String _$futureProductsListHash() =>
    r'1e0e99f9560f1f2cecbb01ca2fea527178a36bb3';

/// See also [futureProductsList].
@ProviderFor(futureProductsList)
final futureProductsListProvider =
    AutoDisposeFutureProvider<List<Product>>.internal(
  futureProductsList,
  name: r'futureProductsListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$futureProductsListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FutureProductsListRef = AutoDisposeFutureProviderRef<List<Product>>;
String _$streamProductHash() => r'd4e50780d68783c7922b15ef3e0adf91b09923a4';

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

/// See also [streamProduct].
@ProviderFor(streamProduct)
const streamProductProvider = StreamProductFamily();

/// See also [streamProduct].
class StreamProductFamily extends Family<AsyncValue<Product?>> {
  /// See also [streamProduct].
  const StreamProductFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'streamProductProvider';

  /// See also [streamProduct].
  StreamProductProvider call(
    ProductID id,
  ) {
    return StreamProductProvider(
      id,
    );
  }

  @visibleForOverriding
  @override
  StreamProductProvider getProviderOverride(
    covariant StreamProductProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      Stream<Product?> Function(StreamProductRef ref) create) {
    return _$StreamProductFamilyOverride(this, create);
  }
}

class _$StreamProductFamilyOverride
    implements FamilyOverride<AsyncValue<Product?>> {
  _$StreamProductFamilyOverride(this.overriddenFamily, this.create);

  final Stream<Product?> Function(StreamProductRef ref) create;

  @override
  final StreamProductFamily overriddenFamily;

  @override
  StreamProductProvider getProviderOverride(
    covariant StreamProductProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [streamProduct].
class StreamProductProvider extends AutoDisposeStreamProvider<Product?> {
  /// See also [streamProduct].
  StreamProductProvider(
    ProductID id,
  ) : this._internal(
          (ref) => streamProduct(
            ref as StreamProductRef,
            id,
          ),
          from: streamProductProvider,
          name: r'streamProductProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$streamProductHash,
          dependencies: StreamProductFamily._dependencies,
          allTransitiveDependencies:
              StreamProductFamily._allTransitiveDependencies,
          id: id,
        );

  StreamProductProvider._internal(
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
    Stream<Product?> Function(StreamProductRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: StreamProductProvider._internal(
        (ref) => create(ref as StreamProductRef),
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
    return _StreamProductProviderElement(this);
  }

  StreamProductProvider _copyWith(
    Stream<Product?> Function(StreamProductRef ref) create,
  ) {
    return StreamProductProvider._internal(
      (ref) => create(ref as StreamProductRef),
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
    return other is StreamProductProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin StreamProductRef on AutoDisposeStreamProviderRef<Product?> {
  /// The parameter `id` of this provider.
  ProductID get id;
}

class _StreamProductProviderElement
    extends AutoDisposeStreamProviderElement<Product?> with StreamProductRef {
  _StreamProductProviderElement(super.provider);

  @override
  ProductID get id => (origin as StreamProductProvider).id;
}

String _$futureProductHash() => r'fdf06bc97757344c5b0f433255d189af8fbac399';

/// See also [futureProduct].
@ProviderFor(futureProduct)
const futureProductProvider = FutureProductFamily();

/// See also [futureProduct].
class FutureProductFamily extends Family<AsyncValue<Product?>> {
  /// See also [futureProduct].
  const FutureProductFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'futureProductProvider';

  /// See also [futureProduct].
  FutureProductProvider call(
    ProductID id,
  ) {
    return FutureProductProvider(
      id,
    );
  }

  @visibleForOverriding
  @override
  FutureProductProvider getProviderOverride(
    covariant FutureProductProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      FutureOr<Product?> Function(FutureProductRef ref) create) {
    return _$FutureProductFamilyOverride(this, create);
  }
}

class _$FutureProductFamilyOverride
    implements FamilyOverride<AsyncValue<Product?>> {
  _$FutureProductFamilyOverride(this.overriddenFamily, this.create);

  final FutureOr<Product?> Function(FutureProductRef ref) create;

  @override
  final FutureProductFamily overriddenFamily;

  @override
  FutureProductProvider getProviderOverride(
    covariant FutureProductProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [futureProduct].
class FutureProductProvider extends AutoDisposeFutureProvider<Product?> {
  /// See also [futureProduct].
  FutureProductProvider(
    ProductID id,
  ) : this._internal(
          (ref) => futureProduct(
            ref as FutureProductRef,
            id,
          ),
          from: futureProductProvider,
          name: r'futureProductProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$futureProductHash,
          dependencies: FutureProductFamily._dependencies,
          allTransitiveDependencies:
              FutureProductFamily._allTransitiveDependencies,
          id: id,
        );

  FutureProductProvider._internal(
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
    FutureOr<Product?> Function(FutureProductRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FutureProductProvider._internal(
        (ref) => create(ref as FutureProductRef),
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
    return _FutureProductProviderElement(this);
  }

  FutureProductProvider _copyWith(
    FutureOr<Product?> Function(FutureProductRef ref) create,
  ) {
    return FutureProductProvider._internal(
      (ref) => create(ref as FutureProductRef),
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
    return other is FutureProductProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FutureProductRef on AutoDisposeFutureProviderRef<Product?> {
  /// The parameter `id` of this provider.
  ProductID get id;
}

class _FutureProductProviderElement
    extends AutoDisposeFutureProviderElement<Product?> with FutureProductRef {
  _FutureProductProviderElement(super.provider);

  @override
  ProductID get id => (origin as FutureProductProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
