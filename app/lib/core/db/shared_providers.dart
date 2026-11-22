import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/profile/data/profile_repository.dart';
import 'app_database.dart';
import 'repositories.dart';

/// Profile, goals and latest weight.
final profileProvider = StreamProvider<ProfileData>(
  (ref) => ref.watch(profileRepositoryProvider).watch(),
);

/// Optional nutrient codes the user chose to see, in catalog order.
final trackedNutrientsProvider = Provider<List<String>>((ref) {
  final tracked =
      ref.watch(profileProvider).value?.trackedNutrients ?? const <String>[];
  return [
    for (final (code, _) in optionalNutrients)
      if (tracked.contains(code)) code,
  ];
});

/// All meal groups (hidden included), in display order.
final mealGroupsProvider = StreamProvider<List<MealGroup>>(
  (ref) => ref.watch(mealGroupsRepositoryProvider).watchAll(),
);

final visibleMealGroupsProvider = Provider<List<MealGroup>>(
  (ref) => [
    for (final g in ref.watch(mealGroupsProvider).value ?? const <MealGroup>[])
      if (!g.isHidden) g,
  ],
);
