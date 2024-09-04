import '../domain/entities/scheduled_field.dart';

List<ScheduledField> copyListAndSortByDate(ScheduledField item, List<ScheduledField> list) {
  final List<ScheduledField> newList = List<ScheduledField>.from(list);
  newList.add(item);
  newList.sort((a, b) {
    var splitA = a.date.split("/");
    var dateA = "${splitA[2]}${splitA[1]}${splitA[0]}";
    var splitB = b.date.split("/");
    var dateB = "${splitB[2]}${splitB[1]}${splitB[0]}";

    return dateA.compareTo(dateB);
  });

  return newList;
}
