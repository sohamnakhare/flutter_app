import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import '../model/Report.dart';

class ReportApi {
  final String baseUrl;
  final String authToken;

  ReportApi(this.baseUrl, this.authToken);

  Future<Report> getReportForProduct(String product) async {
    var url = baseUrl + 'AllocDetailApi/summary/$product';
    final response = await http
        .get(url, headers: {'Authorization': 'Bearer ' + this.authToken});

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON.
      Report report = Report.fromJson(json.decode(response.body));
      return report;
    } else {
      print(response.body.toString());
      // If that call was not successful, throw an error.
      throw Exception('Failed to load allocations');
    }
  }
}
