import 'package:intl/intl.dart';

String turnTimeStampIntoUsDate(String timestamp) {
  if (timestamp.isEmpty) {
    return "";
  }

  DateTime date = DateTime.parse(timestamp);
  final localTimeZone = DateTime.now().timeZoneOffset;
  date = date.add(localTimeZone);
  return DateFormat('MMMM dd, yyyy').format(date);
}

String turnTimeStampIntoAsianDate(String timestamp) {
  if (timestamp.isEmpty) {
    return "";
  }

  DateTime date = DateTime.parse(timestamp);
  final localTimeZone = DateTime.now().timeZoneOffset;
  date = date.add(localTimeZone);
  return DateFormat('yyyy-mm-dd').format(date);
}

String turnTimeStampIntoTime(String timestamp) {
  if (timestamp.isEmpty) {
    return "";
  }

  DateTime date = DateTime.parse(timestamp);
  final localTimeZone = DateTime.now().timeZoneOffset;
  date = date.add(localTimeZone);
  return DateFormat('HH:mm:ss').format(date);
}
