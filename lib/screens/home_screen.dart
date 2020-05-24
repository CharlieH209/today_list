import 'package:flutter/material.dart';
import '../widgets/TasksList.dart';
import '../screens/new_task_screen.dart';
import 'package:todaylist/models/task.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Task> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      floatingActionButton: FloatingActionButton(
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
                              isCompleted: false));
                        });
                        print(tasks);
                        Navigator.pop(context);
                      })));
        },
        backgroundColor: Colors.blueAccent,
        child: Icon(Icons.add),
      ),
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
              child: StatefulBuilder(
                builder: (context, setState) => TasksList(tasks, setState),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
