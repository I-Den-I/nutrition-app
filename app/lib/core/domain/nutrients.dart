import 'package:meta/meta.dart';

/// An amount of nutrients: core macros + optional extras keyed by code
/// (see `optionalNutrients` in the database).
///
/// Used both for "per 100 g" values and for concrete portions.
@immutable
class Nutrients {
  const Nutrients({
    required this.kcal,
    required this.protein,
    required this.fat,
    required this.carbs,
    this.extra = const {},
  });

  static const zero = Nutrients(kcal: 0, protein: 0, fat: 0, carbs: 0);

  final double kcal;
  final double protein;
  final double fat;
  final double carbs;
  final Map<String, double> extra;

  Nutrients operator +(Nutrients o) => Nutrients(
    kcal: kcal + o.kcal,
    protein: protein + o.protein,
    fat: fat + o.fat,
    carbs: carbs + o.carbs,
    extra: {
      for (final k in {...extra.keys, ...o.extra.keys})
        k: (extra[k] ?? 0) + (o.extra[k] ?? 0),
    },
  );

  Nutrients scale(double factor) => Nutrients(
    kcal: kcal * factor,
    protein: protein * factor,
    fat: fat * factor,
    carbs: carbs * factor,
    extra: {for (final e in extra.entries) e.key: e.value * factor},
  );

  /// Portion of [grams] for a value given per 100 g/ml.
  Nutrients portion(double grams) => scale(grams / 100);

  static Nutrients sum(Iterable<Nutrients> items) =>
      items.fold(zero, (a, b) => a + b);

  @override
  bool operator ==(Object other) =>
      other is Nutrients &&
      other.kcal == kcal &&
      other.protein == protein &&
      other.fat == fat &&
      other.carbs == carbs &&
      _mapEquals(other.extra, extra);

  @override
  int get hashCode => Object.hash(
    kcal,
    protein,
    fat,
    carbs,
    Object.hashAllUnordered(extra.entries.map((e) => Object.hash(e.key, e.value))),
  );

  @override
  String toString() =>
      'Nutrients(kcal: $kcal, p: $protein, f: $fat, c: $carbs, extra: $extra)';
}

bool _mapEquals(Map<String, double> a, Map<String, double> b) {
  if (a.length != b.length) return false;
  for (final e in a.entries) {
    if (b[e.key] != e.value) return false;
  }
  return true;
}
