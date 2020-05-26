import 'dart:convert';
import 'package:flutter/material.dart';
import '../widgets/TasksList.dart';
import '../screens/new_task_screen.dart';
import 'package:todaylist/models/task.dart';
import '../widgets/ListPlaceholder.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Task> tasks = [];
  bool taskCreated = false;
  bool previousTasks = false;
  DateTime today = new DateTime.now();
  File localPath;

  @override
  void initState() {
    super.initState();
    initFromStorage();
  }

  void initFromStorage() async {
    localPath = await getLocalPath();

    if (await localPath.exists() == false) {
      await localPath.create();
    } else {
      String contents = await localPath.readAsString();

      // Decode and add old tasks to new list
      List<dynamic> oldTasksDyn = jsonDecode(contents);
      List<Task> oldTasks = [];

      oldTasksDyn.forEach((o) => oldTasks.add(Task(
          name: o["name"],
          severity: o["severity"],
          isCompleted: o["isCompleted"],
          dateCreated: DateTime.parse(o["dateCreated"]))));

      if (oldTasks.length > 0) {
        bool prev = false;

        oldTasks.forEach((t) {
          if (today.difference(t.dateCreated).inDays > 0) prev = true;
        });

        setState(() {
          previousTasks = prev;
          tasks = oldTasks;
        });
      }
    }
  }

  void addPreviousTasks(bool selection) {
    if (selection) {
      // Set the date created to today for the previous incomplete tasks
      List<Task> newTasks = [];

      tasks.forEach((t) {
        if (!t.isCompleted)
          newTasks.add(Task(
              name: t.name,
              severity: t.severity,
              dateCreated: today,
              isCompleted: false));
      });

      setState(() {
        tasks = newTasks;
        previousTasks = false;
      });
    } else {
      setState(() {
        tasks = [];
        taskCreated = false;
        previousTasks = false;
      });
    }

    updateLocalStorage();
  }

  void updateLocalStorage() async {
    final jsonString =
        jsonEncode(tasks.map((t) => t.toJson()).toList()).toString();

    localPath.writeAsString(jsonString);
  }

  Future<File> getLocalPath() async {
    final dir = await getApplicationDocumentsDirectory();

    return File(dir.path + '/tasks.txt');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      floatingActionButton: !previousTasks
          ? FloatingActionButton(
              onPressed: () {
                showModalBottomSheet(
                    isScrollControlled: false,
                    context: context,
                    builder: (context) => StatefulBuilder(
                        builder: (context, setWidgetState) =>
                            NewTaskScreen((newTaskTitle, severity) {
                              setState(() {
                                tasks.add(Task(
                                    name: newTaskTitle,
                                    severity: severity,
                                    dateCreated: today,
                                    isCompleted: false));
                                taskCreated = true;
                              });
                              updateLocalStorage();
                              Navigator.pop(context);
                            })));
              },
              backgroundColor: Colors.blueAccent,
              child: Icon(Icons.add),
            )
          : null,
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
                top: 45.0, left: 30.0, right: 30.0, bottom: 30.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    CircleAvatar(
                      child: Icon(
                        Icons.list,
                        size: 30.0,
                        color: Colors.blueAccent,
                      ),
                      backgroundColor: Colors.white,
                      radius: 30.0,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'Today List',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50.0,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0))),
                child: tasks.length > 0 && !previousTasks
                    ? TasksList(tasks, (index) {
                        setState(() {
                          tasks[index].toggleCompletion();
                        });
                        updateLocalStorage();
                      }, (index) {
                        setState(() {
                          tasks.removeAt(index);
                        });
                        updateLocalStorage();
                      })
                    : ListPlaceholder(
                        taskCreated, previousTasks, addPreviousTasks)),
          ),
        ],
      ),
    );
  }
}
