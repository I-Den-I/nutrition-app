import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/diary/data/diary_repository.dart';
import '../../features/diary/data/meal_groups_repository.dart';
import '../../features/dishes/data/dishes_repository.dart';
import '../../features/products/data/products_repository.dart';
import '../../features/profile/data/profile_repository.dart';
import '../media/media_repository.dart';
import '../media/media_storage.dart';
import 'database_provider.dart';

final productsRepositoryProvider = Provider(
  (ref) => ProductsRepository(ref.watch(databaseProvider)),
);

final dishesRepositoryProvider = Provider(
  (ref) => DishesRepository(
    ref.watch(databaseProvider),
    ref.watch(productsRepositoryProvider),
  ),
);

final diaryRepositoryProvider = Provider(
  (ref) => DiaryRepository(
    ref.watch(databaseProvider),
    ref.watch(productsRepositoryProvider),
    ref.watch(dishesRepositoryProvider),
  ),
);

final mealGroupsRepositoryProvider = Provider(
  (ref) => MealGroupsRepository(ref.watch(databaseProvider)),
);

final profileRepositoryProvider = Provider(
  (ref) => ProfileRepository(ref.watch(databaseProvider)),
);

final mediaRepositoryProvider = Provider((ref) {
  final db = ref.watch(databaseProvider);
  return MediaRepository(db, MediaStorage(db));
});
