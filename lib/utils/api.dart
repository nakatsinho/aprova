import 'dart:convert';
import 'package:http/http.dart' as http;

class MakeRequest {
  final String _baseURL = "http://9fde-197-249-5-84.ngrok.io/api/";

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
}
