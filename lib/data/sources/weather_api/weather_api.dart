import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../domain/entities/base_forecast.dart';
import 'api_constants.dart';

class Api {
  Future<BaseForecast> getForecast(String date, String time) async {
    final response = await http.get(
      Uri.parse(
          "$baseApiUrl$forecastUrl?q=$defaultCity&days=$defaultAmountOfDays&dt=$date&hour=$time&key=$apiKey"),
    );

    if (response.statusCode == 200) {
      return BaseForecast.fromJson(jsonDecode(response.body));
    }

    return BaseForecast.empty();
  }
}
