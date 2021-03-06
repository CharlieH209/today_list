import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final int severity;
  final String name;
  final bool isCompleted;
  final Function removeCallback;
  final Function completionCallback;

  const TaskTile(this.name, this.severity, this.isCompleted,
      this.removeCallback, this.completionCallback);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name,
          style: TextStyle(
            decoration:
                isCompleted ? TextDecoration.lineThrough : TextDecoration.none,
          )),
      trailing: Icon(Icons.schedule,
          color: severity == 1
              ? Colors.green
              : severity == 2 ? Colors.orange : Colors.red),
      onTap: completionCallback,
      onLongPress: removeCallback,
    );
  }
}
