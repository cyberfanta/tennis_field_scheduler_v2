import '../domain/entities/field_schedule.dart';

String getNextAvailableHour(String field, DateTime currentDate) {
  final FieldSchedule fieldSchedule = fields.firstWhere(
    (h) => h.name == field,
    orElse: () => const FieldSchedule("", FieldType.a, "", "", "", 0, "", []),
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
