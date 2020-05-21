import 'package:flutter/material.dart';
import 'TaskTile.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[TaskTile(), TaskTile()],
    );
  }
}
