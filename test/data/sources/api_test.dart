import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tennis_field_scheduler_v2/data/sources/weather_api/weather_api.dart';
import 'package:tennis_field_scheduler_v2/domain/entities/base_forecast.dart';

BaseForecast _baseForecastEmpty = BaseForecast.empty();

class MockApi extends Mock implements Api {
  @override
  Future<BaseForecast> getForecast(String date, String time) async {
    return Future.value(_baseForecastEmpty);
  }

  @override
  Future<BaseForecast> getForecastWithoutTime(String date) async {
    return Future.value(_baseForecastEmpty);
  }
}

void main() {
  MockApi mockApi = MockApi();
  var now = DateTime.now();

  setUp(() {});

  tearDown(() {});

  test("getForecast", () async {
    expect(
        await mockApi.getForecast(
            "${now.year}-${now.month < 10 ? "0" : ""}${now.month}-${now.day < 10 ? "0" : ""}${now.day}",
            "${now.hour}"),
        _baseForecastEmpty);
  });

  test("getForecastWithoutTime", () async {
    expect(
        await mockApi.getForecastWithoutTime(
            "${now.year}-${now.month < 10 ? "0" : ""}${now.month}-${now.day < 10 ? "0" : ""}${now.day}"),
        _baseForecastEmpty);
  });
}
