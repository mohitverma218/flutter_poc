import 'package:covid19/src/ui/widgets/watcher_toolbar.dart';
import 'package:flutter/material.dart';
import '../models/stats_model.dart';
import '../blocs/stats_bloc.dart';
import '../ui/shared/ui_reducers.dart';
import '../ui/widgets/stats_counter.dart';
import '..//ui/shared/app_colors.dart';

class CoronavirusStats extends StatelessWidget {

  static const BoxDecoration topLineBorderDecoration = BoxDecoration(
      border: Border(
          top: BorderSide(
              color: lightGrey, style: BorderStyle.solid, width: 5.0)));

  @override
  Widget build(BuildContext context) {
    bloc.fetchCurrentStats();
    return Scaffold(
      body: StreamBuilder(
        stream: bloc.currentStats,
        builder: (context, AsyncSnapshot<StatsModel> snapshot) {
          if (snapshot.hasData) {
            return buildView(snapshot, context);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget buildView(AsyncSnapshot<StatsModel> snapshot, BuildContext context) {
    return Column(children: [
      WatcherToolbar(title: 'COVID-19'),
      _getHeightContainer(
        context: context,
        height: screenHeight(context, dividedBy: 3, decreasedBy: toolbarHeight),
        child: StatsCounter(
          size: screenHeight(context, dividedBy: 3, decreasedBy: toolbarHeight),
          count: snapshot.data.cases,
          title: 'Cases',
          titleColor: Colors.red,
        ),
      ),
      _getHeightContainer(
        context: context,
        height: screenHeight(context, dividedBy: 3, decreasedBy: toolbarHeight),
        child: StatsCounter(
          size: screenHeight(context, dividedBy: 3, decreasedBy: toolbarHeight),
          count: snapshot.data.deaths,
          title: 'Deaths',
          titleColor: Colors.red,
        ),
      ),
      _getHeightContainer(
        context: context,
        height: screenHeight(context, dividedBy: 3, decreasedBy: toolbarHeight),
        child: StatsCounter(
          size: screenHeight(context, dividedBy: 3, decreasedBy: toolbarHeight),
          count: snapshot.data.recovered,
          title: 'Recovered',
          titleColor: Colors.red,
        ),
      )
    ]);
  }

  Widget _getHeightContainer(
      {double height,
        BuildContext context,
        Widget child,
        bool hasTopStroke = false}) {
    return Container(
        height: height,
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 20.0),
        decoration: hasTopStroke? topLineBorderDecoration : null,
        child: child);
  }
}