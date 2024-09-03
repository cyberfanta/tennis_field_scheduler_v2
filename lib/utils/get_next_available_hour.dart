import '../domain/entities/field_schedule.dart';

String getNextAvailableHour(String field, DateTime currentDate) {
  final TennisField fieldSchedule = fields.firstWhere(
    (h) => h.name == field,
    orElse: () => const TennisField(
        "", FieldType.a, "", "", "", 0, "", [FieldDays.sunday], []),
  );

  if (fieldSchedule.name == "") {
    return "";
  }

  final currentHour = currentDate.hour;
  final availableHours = fieldSchedule.availableHours;

  for (final hour in availableHours) {
    final hourInt = int.parse(hour.replaceAll('am', ''));
    if (hourInt > currentHour) {
      return hour;
    }
  }

  return "";
}
