import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

class AddActivityApi {
  final String baseUrl;
  final String authToken;

  AddActivityApi(this.baseUrl, this.authToken);

  Future<http.Response> savePayment(Map payload) async {
    var url = baseUrl + 'AllocActivityApi';

    final response = await http.post(url, body: json.encode(payload), headers: {
      'Authorization': 'Bearer ' + this.authToken,
      'Content-Type': 'application/json'
    });

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON.
      return response;
    } else {
      print(response.body.toString());
      // If that call was not successful, throw an error.
      throw Exception('Failed to save activity');
    }
  }
}
