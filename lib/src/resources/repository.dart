import 'dart:async';
import 'stats_api_provider.dart';
import '../models/stats_model.dart';

class Repository {
  final statsApiProvider = StatsApiProvider();

  Future<StatsModel> fetchCurrentStats() => statsApiProvider.fetchStats();
}