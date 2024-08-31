import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:http/http.dart' as http;

import '../../utils/get_file_path.dart';
import '../../utils/stamp.dart';
import '../models/status_body/status_body.dart';

class ApiSource {
  final String _tag = "ApiSource";
  Map<String, String> headers = {
    'Content-Type': 'application/json; charset=utf-8',
    // todo: A ser usado cuando se decida el metodo de authenticación
    // 'Authorization': 'Bearer $token',
  };

  Future<StatusBody> getQuery(
    String url,
  ) async {
    Uri uri = Uri.parse(url);

    try {
      http.Response response = await http.get(
        uri,
        headers: headers,
      );

      StatusBody answer =
          StatusBody(statusCode: response.statusCode, body: response.body);
      stamp(_tag, "GetQuery: StatusCode ${answer.statusCode}");

      return answer;
    } catch (e) {
      return StatusBody(statusCode: 500, body: e.toString());
    }
  }

  Future<StatusBody> getQueryUsingBytes(
    String url,
  ) async {
    Uri uri = Uri.parse(url);

    try {
      http.Response response = await http.get(
        uri,
        headers: headers,
      );

      StatusBody answer = StatusBody(
          statusCode: response.statusCode,
          body: utf8.decode(response.bodyBytes));
      stamp(_tag, "GetQuery: StatusCode ${answer.statusCode}");

      return answer;
    } catch (e) {
      return StatusBody(statusCode: 500, body: e.toString());
    }
  }

  Future<StatusBody> getBinary(
    String url,
    String mediaIdAsFilename,
  ) async {
    final Uri uri = Uri.parse(url);

    try {
      final String fileName = await getFlowFeedPath(mediaIdAsFilename);
      final File file = File(fileName);

      if (await file.exists()) {
        return StatusBody(statusCode: 200, body: file.path);
      }

      final http.Response response = await http.get(
        uri,
        headers: headers,
      );

      await file.writeAsBytes(response.bodyBytes);

      return StatusBody(statusCode: response.statusCode, body: file.path);
    } catch (e) {
      return StatusBody(statusCode: 500, body: e.toString());
    }
  }

  Future<StatusBody> postQuery(
    String url, [
    Map<String, dynamic>? body,
  ]) async {
    Uri uri = Uri.parse(url);

    try {
      http.Response response = await http.post(
        uri,
        headers: headers,
        body: jsonEncode(body),
      );

      StatusBody answer =
          StatusBody(statusCode: response.statusCode, body: response.body);
      stamp(_tag, "PostQuery: StatusCode ${answer.statusCode}\n");

      return answer;
    } catch (e) {
      return StatusBody(statusCode: 500, body: e.toString());
    }
  }

  Future<StatusBody> putQuery(
    String url, [
    Map<String, dynamic>? body,
  ]) async {
    Uri uri = Uri.parse(url);

    try {
      http.Response response = await http.put(
        uri,
        headers: headers,
        body: jsonEncode(body),
      );

      StatusBody answer =
          StatusBody(statusCode: response.statusCode, body: response.body);
      stamp(_tag, "PutQuery: StatusCode ${answer.statusCode}");

      return answer;
    } catch (e) {
      return StatusBody(statusCode: 500, body: e.toString());
    }
  }

  Future<StatusBody> putBinary(
    String url,
    Map<String, String>? headers, [
    Uint8List? body,
  ]) async {
    Uri uri = Uri.parse(url);

    try {
      http.Response response = await http.put(
        uri,
        headers: headers,
        body: body,
      );

      StatusBody answer =
          StatusBody(statusCode: response.statusCode, body: response.body);
      stamp(_tag, "PutBinary: StatusCode ${answer.statusCode}");

      return answer;
    } catch (e) {
      return StatusBody(statusCode: 500, body: e.toString());
    }
  }
}
