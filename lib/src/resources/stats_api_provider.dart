import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../models/stats_model.dart';

class StatsApiProvider {
  Client client = Client();

  Future<StatsModel> fetchStats() async {
    print("entered");
    final response = await client
        .get("https://corona.lmao.ninja/all");
    print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return StatsModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}