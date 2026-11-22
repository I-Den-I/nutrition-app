import 'package:meta/meta.dart';

import 'nutrients.dart';

/// One ingredient of a dish: its values per 100 g and the raw weight used.
@immutable
class DishIngredient {
  const DishIngredient({required this.per100, required this.grams});

  final Nutrients per100;
  final double grams;
}

@immutable
class DishBreakdown {
  const DishBreakdown({
    required this.contributions,
    required this.total,
    required this.weightG,
    required this.per100,
  });

  /// What each ingredient adds to the dish, in input order.
  final List<Nutrients> contributions;

  /// Whole dish.
  final Nutrients total;

  /// Weight the [per100] values are based on: cooked weight if known,
  /// otherwise the sum of raw ingredient weights.
  final double weightG;

  /// Per 100 g of the finished dish. [Nutrients.zero] for an empty dish.
  final Nutrients per100;
}

/// Calculates a dish: per ingredient, whole dish and per 100 g.
///
/// [cookedWeightG] accounts for water lost/absorbed while cooking
/// (e.g. 100 g dry rice → 300 g cooked).
DishBreakdown calculateDish(
  List<DishIngredient> ingredients, {
  double? cookedWeightG,
}) {
  final contributions = [
    for (final i in ingredients) i.per100.portion(i.grams),
  ];
  final total = Nutrients.sum(contributions);
  final rawWeight = ingredients.fold<double>(0, (s, i) => s + i.grams);
  final weight = (cookedWeightG != null && cookedWeightG > 0)
      ? cookedWeightG
      : rawWeight;

  return DishBreakdown(
    contributions: contributions,
    total: total,
    weightG: weight,
    per100: weight > 0 ? total.scale(100 / weight) : Nutrients.zero,
  );
}
