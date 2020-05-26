import 'package:flutter/material.dart';
import 'TaskTile.dart';
import 'package:todaylist/models/task.dart';

class TasksList extends StatelessWidget {
  final List<Task> tasks;
  final Function removeCallback;
  final Function toggleCallback;

  TasksList(this.tasks, this.removeCallback, this.toggleCallback);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
            tasks[index].name,
            tasks[index].severity,
            tasks[index].isCompleted,
            () => toggleCallback(index),
            () => removeCallback(index));
      },
      itemCount: tasks != null ? tasks.length : 0,
    );
  }
}
