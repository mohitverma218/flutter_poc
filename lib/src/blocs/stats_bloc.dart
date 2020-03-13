import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/stats_model.dart';

class StatsBloc {
  final _repository = Repository();
  final _statsFetcher = PublishSubject<StatsModel>();

  Observable<StatsModel> get currentStats => _statsFetcher.stream;

  fetchCurrentStats() async {
    StatsModel statsModel = await _repository.fetchCurrentStats();
    _statsFetcher.sink.add(statsModel);
  }

  dispose() {
    _statsFetcher.close();
  }
}

final bloc = StatsBloc();