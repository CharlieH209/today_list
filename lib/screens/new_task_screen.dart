import 'package:flutter/material.dart';

class NewTaskScreen extends StatefulWidget {
  final Function newTaskCallback;

  NewTaskScreen(this.newTaskCallback);

  @override
  _NewTaskScreenState createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  String newTaskTitle;
  int severity;

  List<DropdownMenuItem> severityItems = [
    DropdownMenuItem(
      child: Text('High Urgency', style: TextStyle(color: Colors.red)),
      value: 3,
    ),
    DropdownMenuItem(
      child: Text(
        'Moderate Urgency',
        style: TextStyle(color: Colors.orange),
      ),
      value: 2,
    ),
    DropdownMenuItem(
      child: Text('Low Urgency', style: TextStyle(color: Colors.green)),
      value: 1,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        margin: EdgeInsets.only(top: 0),
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'New Task',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30.0, color: Colors.blueAccent),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (title) {
                newTaskTitle = title;
              },
            ),
            DropdownButton(
              hint: Text('Task Urgency'),
              items: severityItems,
              value: severity,
              onChanged: (value) {
                setState(() {
                  severity = value;
                });
              },
              isExpanded: true,
            ),
            FlatButton(
              child: Text(
                'Add',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blueAccent,
              onPressed: () {
                widget.newTaskCallback(newTaskTitle, severity);
              },
            ),
          ],
        ),
      ),
    );
  }
}
