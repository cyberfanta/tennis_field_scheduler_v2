import 'package:intl/intl.dart';

String turnTimeStampIntoUsDate(String timestamp) {
  if (timestamp.isEmpty) {
    return "";
  }

  DateTime date = DateTime.parse(timestamp);
  // final localTimeZone = DateTime.now().timeZoneOffset;
  // date = date.add(localTimeZone);
  return DateFormat('MMMM dd, yyyy').format(date);
}

String turnTimeStampIntoAsianDate(String timestamp) {
  if (timestamp.isEmpty) {
    return "";
  }

  DateTime date = DateTime.parse(timestamp);
  // final localTimeZone = DateTime.now().timeZoneOffset;
  // date = date.add(localTimeZone);
  return DateFormat('yyyy-MM-dd').format(date);
}

String turnDateTimeIntoAsianDate(DateTime date) {
  // final localTimeZone = DateTime.now().timeZoneOffset;
  // date = date.add(localTimeZone);
  return DateFormat('yyyy-MM-dd').format(date);
}

String turnTimeStampIntoLatinDate(String timestamp) {
  if (timestamp.isEmpty) {
    return "";
  }

  DateTime date = DateTime.parse(timestamp);
  // final localTimeZone = DateTime.now().timeZoneOffset;
  // date = date.add(localTimeZone);
  return DateFormat('dd-MM-yyyy').format(date);
}

String turnDateTimeIntoLatinDate(DateTime date) {
  // final localTimeZone = DateTime.now().timeZoneOffset;
  // date = date.add(localTimeZone);
  return DateFormat('dd-MM-yyyy').format(date);
}

String turnTimeStampIntoTime(String timestamp) {
  if (timestamp.isEmpty) {
    return "";
  }

  DateTime date = DateTime.parse(timestamp);
  // final localTimeZone = DateTime.now().timeZoneOffset;
  // date = date.add(localTimeZone);
  return DateFormat('HH:mm:ss').format(date);
}
