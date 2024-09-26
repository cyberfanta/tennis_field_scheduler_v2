import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tennis_field_scheduler_v2/data/sources/local_data/local_data.dart';

class MockLocalData extends Mock implements LocalData {
  @override
  Future<int> getInt(String intName) async {
    return Future.value(-25000);
  }

  @override
  Future<bool> setInt(String intName, int value) async {
    return Future.value(true);
  }

  @override
  Future<String> getString(String stringName) async {
    return Future.value("");
  }

  @override
  Future<List<String>> getStringList(String stringName) async {
    return Future.value([]);
  }

  @override
  Future<bool> setString(String stringName, String value) async {
    return Future.value(true);
  }

  @override
  Future<bool> setStringList(String stringName, List<String> value) async {
    return Future.value(true);
  }
}

void main() {
  MockLocalData mockLocalData = MockLocalData();

  setUp(() {});

  tearDown(() {});

  test("getInt", () async {
    expect(await mockLocalData.getInt("any"), -25000);
  });

  test("setInt", () async {
    expect(await mockLocalData.setInt("any", -25000), true);
  });

  test("getString", () async {
    expect(await mockLocalData.getString("any"), "");
  });

  test("setString", () async {
    expect(await mockLocalData.setString("any", ""), true);
  });

  test("getStringList", () async {
    expect(await mockLocalData.getStringList("any"), []);
  });

  test("setStringList", () async {
    expect(await mockLocalData.setStringList("any", []), true);
  });
}
