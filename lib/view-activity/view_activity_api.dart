import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import '../model/Activity.dart';

class ViewActivityApi {
  final String baseUrl;
  final String authToken;

  ViewActivityApi(this.baseUrl, this.authToken);

  Future<List<Activity>> getActivitiesByAllocId(int allocId) async {
    var url = baseUrl + 'AllocActivityApi/list/$allocId';
    final response = await http
        .get(url, headers: {'Authorization': 'Bearer ' + this.authToken});

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON.
      Iterable l = json.decode(response.body);
      List<Activity> activities =
          l.map((model) => Activity.fromJson(model)).toList();
      return activities;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load allocations');
    }
  }
}
