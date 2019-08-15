import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class LoginApi {
  final String baseUrl;

  LoginApi(this.baseUrl);

  Future<http.Response> getOTP(String phoneNumber) async {
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

  Future<http.Response> verifyOTP(String mobileNumber, String otp) async {
    var url = baseUrl + 'MobileAuthApi';
    var payload = new Map<String, dynamic>();
    payload["otp"] = otp;
    payload["phoneNo"] = mobileNumber;
    final response = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(payload));

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON.
      return response;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to verify otp');
    }
  }
}
