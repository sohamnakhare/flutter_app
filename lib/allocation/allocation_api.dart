import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import '../model/Allocation.dart';
import '../model/Payment.dart';

class AllocationApi {
  final String baseUrl;
  final String authToken;

  AllocationApi(this.baseUrl, this.authToken);

  Future<List<Allocation>> getAllocationByUser() async {
    var url = baseUrl + 'AllocDetailApi/user';
    final response = await http
        .get(url, headers: {'Authorization': 'Bearer ' + this.authToken});

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON.
      Iterable l = json.decode(response.body);
      List<Allocation> allocations =
          l.map((model) => Allocation.fromJson(model)).toList();
      print(allocations.length);
      return allocations;
    } else {
      print(response.toString());
      // If that call was not successful, throw an error.
      throw Exception('Failed to load allocations');
    }
  }

  Future<Allocation> getAllocationDetailsById(int allocId) async {
    var url = baseUrl + 'AllocDetailApi/$allocId';
    final response = await http
        .get(url, headers: {'Authorization': 'Bearer ' + this.authToken});

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON.
      return Allocation.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load allocations');
    }
  }
}
