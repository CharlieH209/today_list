import 'package:flutter/material.dart';

class TaskTile extends StatefulWidget {
  final int severity;

  const TaskTile(this.severity);

  @override
  _TaskTileState createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool isCompleted = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        setState(() {
          isCompleted = !isCompleted;
        });
      },
      title: Text('test task',
          style: TextStyle(
            decoration:
                isCompleted ? TextDecoration.lineThrough : TextDecoration.none,
          )),
      trailing: Icon(Icons.schedule,
          color: widget.severity == 1
              ? Colors.green
              : widget.severity == 2 ? Colors.orange : Colors.red),
    );
  }
}
