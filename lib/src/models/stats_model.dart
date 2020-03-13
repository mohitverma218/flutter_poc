class StatsModel {
  final int cases;
  final int deaths;
  final int recovered;

  StatsModel({this.cases, this.deaths, this.recovered});

  factory StatsModel.fromJson(Map<String, dynamic> json) {
    return StatsModel(
      cases: json['cases'],
      deaths: json['deaths'],
      recovered: json['recovered'],
    );
  }
}