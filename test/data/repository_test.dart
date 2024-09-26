import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tennis_field_scheduler_v2/app/static_data/static_data.dart';
import 'package:tennis_field_scheduler_v2/data/repository.dart';
import 'package:tennis_field_scheduler_v2/data/sources/local_data/local_data.dart';
import 'package:tennis_field_scheduler_v2/data/sources/weather_api/weather_api.dart';
import 'package:tennis_field_scheduler_v2/domain/entities/base_user.dart';
import 'package:tennis_field_scheduler_v2/domain/entities/reserved_date.dart';

// class MockRepository extends Mock implements Repository {
//   @override
//   final LocalData localData;
//   @override
//   final Api api;
//
//   MockRepository({
//     required this.localData,
//     required this.api,
//   });
// }

class MockLocalData extends Mock implements LocalData {}

class MockApi extends Mock implements Api {}

void main() {
  const String sharedPreferenceUser = "User";
  const String sharedPreferenceReservations = "Reservations";

  currentUser = const BaseUser(
    name: "Julio Leon",
    email: "julioleon2004@gmail.com",
    phone: "04242259220",
    pass: "123",
    remember: false,
  );

  setUp(() {});

  tearDown(() {});

  MockLocalData mockLocalData = MockLocalData();
  MockApi mockApi = MockApi();

  Repository repository = Repository(localData: mockLocalData, api: mockApi);

  test("getLogin - currentUser", () async {
    when(mockLocalData.getString(sharedPreferenceUser))
        .thenAnswer((_) async => baseUserToJson(currentUser));

    expect(await repository.getLogin(), isA<BaseUser>());
  });

  test("getLogin - null", () async {
    when(mockLocalData.getString(sharedPreferenceUser))
        .thenAnswer((_) async => "");

    expect(await repository.getLogin(), null);
  });

  test("validateLogin - currentUser", () async {
    when(mockLocalData.getString(sharedPreferenceUser))
        .thenAnswer((_) async => baseUserToJson(currentUser));

    expect(await repository.validateLogin(), isA<BaseUser>());
  });

  test("validateLogin - null", () async {
    when(mockLocalData.getString(sharedPreferenceUser))
        .thenAnswer((_) async => "");

    expect(await repository.validateLogin(), null);
  });

  test("loadReservedDates() - filled", () async {
    String item = reservedDateToJson(ReservedDate.empty());

    when(json.decode(item))
        .thenReturn(reservedDateToJson(ReservedDate.empty()));

    when(mockLocalData.getStringList(sharedPreferenceReservations))
        .thenAnswer((_) async => [item]);

    expect(await repository.loadReservedDates(), isA<List<ReservedDate>>());
  });

  test("loadReservedDates() - empty", () async {
    when(mockLocalData.getStringList(sharedPreferenceReservations))
        .thenAnswer((_) async => []);

    expect(await repository.loadReservedDates(), []);
  });
}
