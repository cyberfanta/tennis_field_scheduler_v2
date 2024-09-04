import '../domain/entities/scheduled_field.dart';

bool fieldIndexRepeatedThreeTimes(List<ScheduledField> scheduleList) {
  final Map<String, int> fieldIndexCount = {};

  for (final scheduledField in scheduleList) {
    final key = '${scheduledField.fieldIndex}-${scheduledField.date}';
    fieldIndexCount[key] = (fieldIndexCount[key] ?? 0) + 1;

    if (fieldIndexCount[key]! > 2) {
      return true;
    }
  }

  return false;
}

bool hasThreeOccurrencesOnDate2(List<ScheduledField> scheduleList,
    ScheduledField targetField, String targetDate) {
  int count = 0;

  for (final scheduledField in scheduleList) {
    if (scheduledField.date == targetDate &&
        scheduledField.id == targetField.id) {
      count++;
      if (count >= 3) {
        return true;
      }
    }
  }

  return false;
}

bool hasThreeOccurrencesOnDate(List<ScheduledField> scheduleList,
    int targetFieldIndex, String targetDate) {
  int count = 0;

  for (final scheduledField in scheduleList) {
    if (scheduledField.date == targetDate &&
        scheduledField.fieldIndex == targetFieldIndex) {
      count++;
      if (count >= 3) {
        return true; // Encontramos al menos tres ocurrencias del mismo fieldIndex en la fecha dada
      }
    }
  }

  return false; // No se encontraron suficientes ocurrencias
}
