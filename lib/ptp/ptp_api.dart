import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import '../model/PTP.dart';

class PTPApi {
  final String baseUrl;
  final String authToken;

  PTPApi(this.baseUrl, this.authToken);

  Future<List<PTP>> getPTPs() async {
    var url = baseUrl + 'AllocActivityApi/ptpCases';
    final response = await http
        .get(url, headers: {'Authorization': 'Bearer ' + this.authToken});

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON.
      print(response.body.toString());
      Iterable l = json.decode(response.body);
      List<PTP> ptps = l.map((model) => PTP.fromJson(model)).toList();
      return ptps;
    } else {
      print(response.body.toString());
      // If that call was not successful, throw an error.
      throw Exception('Failed to load allocations');
    }
  }
}
