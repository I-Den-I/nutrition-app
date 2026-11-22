import 'package:intl/intl.dart';

/// Local calendar day key `yyyy-MM-dd` used in the database.
String dayKey(DateTime d) =>
    '${d.year.toString().padLeft(4, '0')}-'
    '${d.month.toString().padLeft(2, '0')}-'
    '${d.day.toString().padLeft(2, '0')}';

DateTime parseDayKey(String key) {
  final p = key.split('-').map(int.parse).toList();
  return DateTime(p[0], p[1], p[2]);
}

/// Parses user input that may use a comma as decimal separator
/// ("12,5" in de/uk/ru). Returns null for empty or invalid input.
double? parseDecimal(String input) {
  final s = input.trim().replaceAll(' ', '').replaceAll(',', '.');
  if (s.isEmpty) return null;
  return double.tryParse(s);
}

/// Formats a nutrient amount: no decimals from 100 up, one below.
String formatAmount(double v, String locale) {
  final f = NumberFormat.decimalPattern(locale)
    ..maximumFractionDigits = v.abs() >= 100 ? 0 : 1
    ..minimumFractionDigits = 0;
  return f.format(v);
}

/// Value for an editable text field: "12.5" → "12,5" in comma locales,
/// without grouping separators.
String formatInput(double? v, String locale) {
  if (v == null) return '';
  final f = NumberFormat.decimalPattern(locale)
    ..maximumFractionDigits = 2
    ..turnOffGrouping();
  return f.format(v);
}
