import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/db/app_database.dart';
import '../../../core/db/repositories.dart';
import '../data/products_repository.dart';

final productsSearchProvider = StreamProvider.autoDispose
    .family<List<Product>, String>(
      (ref, query) =>
          ref.watch(productsRepositoryProvider).watchAll(query: query),
    );

final productDetailsProvider = StreamProvider.autoDispose
    .family<ProductDetails?, String>(
      (ref, id) => ref.watch(productsRepositoryProvider).watch(id),
    );
