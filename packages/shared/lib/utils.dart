import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:package_info_plus/package_info_plus.dart';

/// console log
///
void console(String tag, String message) {
  if (kDebugMode) {
    print('<<< start-[$tag]-start >>>\n\n$message\n\n<<< end-[$tag]-end >>>\n');
  }
}

/// [String] with `NullSafety` for serializable.
///
String stringFromJson(Object? json) {
  return (json as String?) ?? '';
}

Future<void> chooseDate(
  BuildContext context, {
  required DateTime initialDate,
  required Function(DateTime?) onSelect,
  DateTime? firstDate,
  DateTime? lastDate,
}) async {
  final today = DateTime.now();
  final DateTime? selected = await showDatePicker(
    context: context,
    initialDate: initialDate,
    firstDate: firstDate ?? DateTime(2020),
    lastDate: lastDate ?? DateTime(today.year + 1, today.month, today.day),
  );
  onSelect(selected);
}

String getFormattedDateString(
  DateTime date, {
  String pattern = 'dd-MM-yyyy',
}) {
  final formatter = DateFormat(pattern);
  return formatter.format(date);
}

String getTodayDateString({
  String pattern = 'dd-MM-yyyy',
}) =>
    getFormattedDateString(
      DateTime.now(),
      pattern: pattern,
    );

void showSnackBar(
  BuildContext context, {
  required Widget content,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: content,
    ),
  );
}

Future<PackageInfo> getBuildPackageInfo() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  return packageInfo;
}

DateTime getYesterday(DateTime today) =>
    today.subtract(const Duration(days: 1));

/// Find the first date of the week which contains the provided date.
///
/// Assume `Monday` is the first day of the week and
/// `Sunday` is the last day of the week
DateTime findFirstDateOfTheWeek(DateTime dateTime) =>
    dateTime.subtract(Duration(days: dateTime.weekday - 1));

/// Find last date of the week which contains provided date.
///
/// Assume `Monday` is the first day of the week and
/// `Sunday` is the last day of the week
DateTime findLastDateOfTheWeek(DateTime dateTime) =>
    dateTime.add(Duration(days: DateTime.daysPerWeek - dateTime.weekday));

/// Find first date of previous week using a date in current week.
/// [dateTime] A date in current week.
DateTime findFirstDateOfPreviousWeek(DateTime dateTime) {
  final DateTime sameWeekDayOfLastWeek =
      dateTime.subtract(const Duration(days: 7));
  return findFirstDateOfTheWeek(sameWeekDayOfLastWeek);
}

/// Find last date of previous week using a date in current week.
/// [dateTime] A date in current week.
DateTime findLastDateOfPreviousWeek(DateTime dateTime) {
  final DateTime sameWeekDayOfLastWeek =
      dateTime.subtract(const Duration(days: 7));
  return findLastDateOfTheWeek(sameWeekDayOfLastWeek);
}

/// Find first date of next week using a date in current week.
/// [dateTime] A date in current week.
DateTime findFirstDateOfNextWeek(DateTime dateTime) {
  final DateTime sameWeekDayOfNextWeek = dateTime.add(const Duration(days: 7));
  return findFirstDateOfTheWeek(sameWeekDayOfNextWeek);
}

/// Find last date of next week using a date in current week.
/// [dateTime] A date in current week.
DateTime findLastDateOfNextWeek(DateTime dateTime) {
  final DateTime sameWeekDayOfNextWeek = dateTime.add(const Duration(days: 7));
  return findLastDateOfTheWeek(sameWeekDayOfNextWeek);
}

DateTime getLastMonth(DateTime dateTime) =>
    DateTime(dateTime.year, dateTime.month - 1, dateTime.day);

DateTime findFirstDateOfTheMonth(DateTime dateTime) =>
    DateTime(dateTime.year, dateTime.month, 1);

DateTime findLastDateOfTheMonth(DateTime dateTime) =>
    DateTime(dateTime.year, dateTime.month + 1, 0);

DateTime findFirstDateOfPreviousMonth(DateTime dateTime) {
  final lastMonth = getLastMonth(dateTime);
  return findFirstDateOfTheMonth(lastMonth);
}

DateTime findLastDateOfPreviousMonth(DateTime dateTime) {
  final lastMonth = getLastMonth(dateTime);
  return findLastDateOfTheMonth(lastMonth);
}
