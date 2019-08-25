import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

class EnumMasterApi {
  final String baseUrl;
  final String authToken;

  EnumMasterApi(this.baseUrl, this.authToken);

  Future<List<String>> getProducts() async {
    var url = baseUrl + 'EnumMasterApi/3';
    final response = await http
        .get(url, headers: {'Authorization': 'Bearer ' + this.authToken});

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON.
      List<dynamic> products = json.decode(response.body);
      return products.cast<String>();
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load allocations');
    }
  }

  Future<List<String>> getPayeeRelation() async {
    var url = baseUrl + 'EnumMasterApi/7';
    final response = await http
        .get(url, headers: {'Authorization': 'Bearer ' + this.authToken});

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON.
      List<dynamic> products = json.decode(response.body);
      return products.cast<String>();
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load allocations');
    }
  }

  Future<List<dynamic>> getEnumMaster() async {
    var url = baseUrl + 'EnumMasterApi';
    final response = await http
        .get(url, headers: {'Authorization': 'Bearer ' + this.authToken});

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON.
      print(response.body.toString());
      List<dynamic> enums = json.decode(response.body);
      return enums;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load allocations');
    }
  }
}
