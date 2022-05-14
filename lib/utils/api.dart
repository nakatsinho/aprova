import 'dart:convert';
import 'package:http/http.dart' as http;

class MakeRequest {
  final String _baseURL = "http://5017-197-235-209-53.ngrok.io/api/";

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
