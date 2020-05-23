import 'package:flutter/material.dart';
import 'TaskTile.dart';
import 'package:todaylist/models/task.dart';

class TasksList extends StatelessWidget {
  final List<Task> tasks;
  final StateSetter setState;

  TasksList(this.tasks, this.setState);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
            tasks[index].name, tasks[index].severity, tasks[index].isCompleted,
            () {
          setState(() {
            tasks[index].toggleCompletion();
          });
        }, () {
          setState(() {
            tasks.removeAt(index);
          });
        });
      },
      itemCount: tasks != null ? tasks.length : 0,
    );
  }
}
