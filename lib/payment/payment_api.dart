import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import '../model/Payment.dart';

class PaymentApi {
  final String baseUrl;
  final String authToken;

  PaymentApi(this.baseUrl, this.authToken);

  Future<Payment> getPaymentByAllocId(int allocId) async {
    var url = baseUrl + 'AllocPaymentApi/$allocId';
    final response = await http
        .get(url, headers: {'Authorization': 'Bearer ' + this.authToken});

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON.
      return Payment.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load allocations');
    }
  }

  Future<http.Response> savePayment(Map payload) async {
    var url = baseUrl + 'AllocPaymentApi';

    final response = await http.post(url, body: json.encode(payload), headers: {
      'Authorization': 'Bearer ' + this.authToken,
      'Content-Type': 'application/json'
    });

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON.
      return response;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to save payment');
    }
  }
}
