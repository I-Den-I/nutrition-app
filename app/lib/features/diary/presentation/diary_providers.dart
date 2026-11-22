import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/db/repositories.dart';
import '../../../core/domain/formatting.dart';
import '../data/diary_repository.dart';

DateTime _dateOnly(DateTime d) => DateTime(d.year, d.month, d.day);

/// The day shown in the diary (and where new entries go).
final selectedDayProvider = NotifierProvider<SelectedDay, DateTime>(
  SelectedDay.new,
);

class SelectedDay extends Notifier<DateTime> {
  @override
  DateTime build() => _dateOnly(DateTime.now());

  void set(DateTime day) => state = _dateOnly(day);

  void shift(int days) =>
      state = DateTime(state.year, state.month, state.day + days);
}

final dayEntriesProvider = StreamProvider.autoDispose
    .family<List<DiaryEntryView>, String>(
      (ref, day) => ref.watch(diaryRepositoryProvider).watchDay(day),
    );

final selectedDayKeyProvider = Provider<String>(
  (ref) => dayKey(ref.watch(selectedDayProvider)),
);
