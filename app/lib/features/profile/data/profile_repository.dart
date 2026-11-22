import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:meta/meta.dart';

import '../../../core/db/app_database.dart';
import '../../../core/db/watch.dart';
import '../../../core/domain/formatting.dart';
import '../../../core/domain/goals_calculator.dart';

@immutable
class ProfileData {
  const ProfileData({
    required this.profile,
    required this.goals,
    required this.weightKg,
  });

  final Profile profile;
  final Goal goals;

  /// Latest logged body weight.
  final double? weightKg;

  List<String> get trackedNutrients =>
      (jsonDecode(profile.trackedNutrients) as List).cast<String>();

  /// Null until every field needed for the calculation is filled in.
  BodyData? bodyData(DateTime today) {
    final p = profile;
    if (p.sex == null ||
        p.birthDate == null ||
        p.heightCm == null ||
        p.activityLevel == null ||
        p.weightGoal == null ||
        weightKg == null) {
      return null;
    }
    return BodyData(
      sex: p.sex!,
      ageYears: ageOn(p.birthDate!, today),
      heightCm: p.heightCm!,
      weightKg: weightKg!,
      activity: p.activityLevel!,
      goal: p.weightGoal!,
    );
  }

  bool get hasGoals => goals.kcal != null;
}

/// The single profile row, goals row and the weight log.
class ProfileRepository {
  ProfileRepository(this._db);

  final AppDatabase _db;

  Stream<ProfileData> watch() =>
      watchTables(_db, [_db.profiles, _db.goals, _db.weightLog], load);

  Future<ProfileData> load() async {
    final profile = await _db.select(_db.profiles).getSingle();
    final goals = await _db.select(_db.goals).getSingle();
    final weight =
        await (_db.select(_db.weightLog)
              ..where((w) => w.deletedAt.isNull())
              ..orderBy([
                (w) => OrderingTerm.desc(w.day),
                (w) => OrderingTerm.desc(w.createdAt),
              ])
              ..limit(1))
            .getSingleOrNull();
    return ProfileData(
      profile: profile,
      goals: goals,
      weightKg: weight?.weightKg,
    );
  }

  Future<void> saveBody({
    required Sex sex,
    required DateTime birthDate,
    required double heightCm,
    required double weightKg,
    required ActivityLevel activity,
    required WeightGoal goal,
  }) => _db.transaction(() async {
    final now = DateTime.now();
    await _db
        .update(_db.profiles)
        .write(
          ProfilesCompanion(
            sex: Value(sex),
            birthDate: Value(birthDate),
            heightCm: Value(heightCm),
            activityLevel: Value(activity),
            weightGoal: Value(goal),
            updatedAt: Value(now),
          ),
        );
    await logWeight(weightKg, day: dayKey(now));
  });

  /// One weight per day: today's value is replaced.
  Future<void> logWeight(double kg, {required String day}) async {
    final now = DateTime.now();
    final existing =
        await (_db.select(_db.weightLog)
              ..where((w) => w.day.equals(day) & w.deletedAt.isNull()))
            .getSingleOrNull();
    if (existing == null) {
      await _db
          .into(_db.weightLog)
          .insert(WeightLogCompanion.insert(day: day, weightKg: kg));
    } else {
      await (_db.update(
        _db.weightLog,
      )..where((w) => w.id.equals(existing.id))).write(
        WeightLogCompanion(weightKg: Value(kg), updatedAt: Value(now)),
      );
    }
  }

  Future<void> saveGoals({
    required GoalMode mode,
    required double kcal,
    required double protein,
    required double fat,
    required double carbs,
  }) => _db
      .update(_db.goals)
      .write(
        GoalsCompanion(
          mode: Value(mode),
          kcal: Value(kcal),
          protein: Value(protein),
          fat: Value(fat),
          carbs: Value(carbs),
          updatedAt: Value(DateTime.now()),
        ),
      );

  /// When goals are in auto mode, recalculates them from the body data.
  Future<void> refreshAutoGoals() async {
    final data = await load();
    if (data.goals.mode != GoalMode.auto) return;
    final body = data.bodyData(DateTime.now());
    if (body == null) return;
    final g = calculateGoals(body);
    await saveGoals(
      mode: GoalMode.auto,
      kcal: g.kcal,
      protein: g.protein,
      fat: g.fat,
      carbs: g.carbs,
    );
  }

  Future<void> setTrackedNutrients(List<String> codes) => _db
      .update(_db.profiles)
      .write(
        ProfilesCompanion(
          trackedNutrients: Value(jsonEncode(codes)),
          updatedAt: Value(DateTime.now()),
        ),
      );
}
