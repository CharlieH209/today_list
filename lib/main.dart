import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() => runApp(TodayList());

class TodayList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
