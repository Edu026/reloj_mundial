import 'package:flutter/material.dart';
import 'package:reloj_mundial/StopWatchPage.dart';
import 'package:reloj_mundial/WorldClockPage.dart';
import 'package:timezone/data/latest.dart' as tz;

void main() {
  tz.initializeTimeZones();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clock',
      initialRoute: '/clock',
      routes: {
        '/clock': (context) => WorldClockPage(),
        '/stopwatch': (context) => StopwatchPage(),
      },
    );
  }
}
