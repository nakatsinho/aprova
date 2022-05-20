import 'dart:convert';
import 'package:aprova/models/exam_type.dart';
import 'package:aprova/utils/env.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class MakeRequest {
  final String _baseURL = APP_URL;

  postData(data, apiUrl) async {
    var path = _baseURL + apiUrl;
    return await http.post(
      Uri.parse(path),
      body: jsonEncode(data),
      headers: _setHeaders(),
    );
  }

  _setHeaders() =>
      {'Content-type': 'application/json', 'Accept': 'application/json'};

  static Future<List<ExamType>>? getAllCountriesModel(
      BuildContext context) async {
    var request = Uri.parse(APP_URL + "fetch/exam_type");
    var response = await http.get(request);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      // print(json.toString());
      return json.map<ExamType>(ExamType.fromJson).toList();
    } else {
      throw Exception();
    }
  }
}
