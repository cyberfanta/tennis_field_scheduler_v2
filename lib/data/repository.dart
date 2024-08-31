import 'dart:convert';

import 'package:tennis_field_scheduler_v2/data/sources/local_data/local_data.dart';
import 'package:tennis_field_scheduler_v2/data/sources/weather_api/weather_api.dart';
import 'package:tennis_field_scheduler_v2/domain/entities/base_forecast.dart';
import 'package:tennis_field_scheduler_v2/domain/entities/reserved_date.dart';

class Repository {
  final LocalData _localData = LocalData();
  final Api _api = Api();

  final String _tag = "Repository";
  final String sharedPreferenceReservations = "Reservations";

  Future<List<ReservedDate>> loadReservedDates() async {
    final List<String> data =
        await _localData.getStringList(sharedPreferenceReservations);
    return data
        .map((str) =>
            ReservedDate.fromJson(json.decode(str) as Map<String, dynamic>))
        .toList();
  }

  Future<void> saveReservedDate(List<ReservedDate> reservedDatesList) async {
    final List<String> data =
        reservedDatesList.map((reservedDate) => reservedDate.toJson()).toList();
    await _localData.setStringList(sharedPreferenceReservations, data);
  }

  Future<BaseForecast> getForecast(String date, String time) {
    return _api.getForecast(date, time);
  }
}
