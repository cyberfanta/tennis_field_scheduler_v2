import '../app/static_data/static_data.dart';

DateTime getNextClosestDay(DateTime currentDate, List<FieldDays> daysList) {
  final currentDayOfWeek = currentDate.weekday;
  final targetDays = daysList.map((day) => day.index + 1).toList();

  targetDays.sort();

  for (final targetDay in targetDays) {
    int daysToAdd = targetDay - currentDayOfWeek;
    if (daysToAdd < 0) {
      daysToAdd += 7;
    }

    final nextDate = currentDate.add(Duration(days: daysToAdd));
    if (nextDate.isAfter(currentDate)) {
      return nextDate;
    }
  }

  final nextWeek = currentDate.add(const Duration(days: 7));
  return DateTime(nextWeek.year, nextWeek.month, targetDays.first);
}
