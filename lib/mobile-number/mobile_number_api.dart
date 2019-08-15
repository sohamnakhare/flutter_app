import 'package:http/http.dart' as http;
import 'dart:async';

class MobileNumberApi {
  final String baseUrl;

  MobileNumberApi(this.baseUrl);

  Future<http.Response> sendOTP(String phoneNumber) async {
    var url = baseUrl + 'MobileAuthApi/$phoneNumber';
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON.
      return response;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
