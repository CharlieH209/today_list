import 'package:flutter/material.dart';

void main() => runApp(TodayList());

class TodayList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Column(
          children: <Widget>[Text('Test')],
        ),
      ),
    );
  }
}
