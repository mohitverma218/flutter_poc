import 'package:flutter/material.dart';
import 'ui/coronavirus_stats.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: CoronavirusStats(),
      ),
    );
  }
}