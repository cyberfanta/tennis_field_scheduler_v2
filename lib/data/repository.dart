import 'dart:convert';

import 'package:tennis_field_scheduler_v2/app/static_data/static_data.dart';
import 'package:tennis_field_scheduler_v2/data/sources/local_data/local_data.dart';
import 'package:tennis_field_scheduler_v2/data/sources/weather_api/weather_api.dart';
import 'package:tennis_field_scheduler_v2/domain/entities/base_forecast.dart';
import 'package:tennis_field_scheduler_v2/domain/entities/base_user.dart';
import 'package:tennis_field_scheduler_v2/domain/entities/reserved_date.dart';
import 'package:tennis_field_scheduler_v2/utils/stamp.dart';

import '../utils/turn_timestamp_into_dates.dart';

class Repository {
  final LocalData localData;
  final Api api;

  Repository({
    required this.localData,
    required this.api,
  });

  final String _tag = "Repository";

  final String sharedPreferenceUser = "User";
  final String sharedPreferenceReservations = "Reservations";

  Future<BaseUser?>? getLogin() async {
    final String data = await localData.getString(sharedPreferenceUser) ?? "";

    if (data.isEmpty) {
      stamp(_tag, "No user saved");
      return null;
    }

    stamp(_tag, "Restoring saved user");
    BaseUser baseUser = baseUserFromJson(data);
    currentUser = baseUser;
    return baseUser;
  }

  Future<BaseUser?>? validateLogin() async {
    final String data = await localData.getString(sharedPreferenceUser) ?? "";

    if (data.isEmpty) {
      stamp(_tag, "No user saved");
      return null;
    }

    stamp(_tag, "Restoring saved user");
    return baseUserFromJson(data);
  }

  Future<void> saveLogin(BaseUser baseUser) async {
    await localData.setString(sharedPreferenceUser, baseUserToJson(baseUser));
  }

  Future<void> removeLogin() async {
    await localData.setString(sharedPreferenceUser, "");
  }

  Future<List<ReservedDate>> loadReservedDates() async {
    final List<String> data =
        await localData.getStringList(sharedPreferenceReservations) ?? [];
    return data
        .map((str) =>
            ReservedDate.fromJson(json.decode(str) as Map<String, dynamic>))
        .toList();
  }

  Future<void> saveReservedDate(List<ReservedDate> reservedDatesList) async {
    final List<String> data =
        reservedDatesList.map((reservedDate) => reservedDate.toJson()).toList();
    await localData.setStringList(sharedPreferenceReservations, data);
  }

  Future<BaseForecast> getForecast(String date, String time) {
    return api.getForecast(date, time);
  }

  Future<BaseForecast> getForecastOfDayWithDateTime(DateTime date) {
    return api.getForecastWithoutTime(turnDateTimeIntoAsianDate(date));
  }
}
