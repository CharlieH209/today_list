import 'package:flutter/material.dart';

class ListPlaceholder extends StatelessWidget {
  final bool freshList;
  final bool previousTasks;
  final Function addPreviousTasks;

  ListPlaceholder(this.freshList, this.previousTasks, this.addPreviousTasks);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: previousTasks
                ? <Widget>[
                    Text(
                      'Welcome Back!',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 24.0,
                    ),
                    Text(
                      'Would you like to add yesterdays incomplete tasks?',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 24.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RaisedButton(
                          child: Text(
                            'Yes',
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.green,
                          onPressed: () => addPreviousTasks(true),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        RaisedButton(
                          child: Text(
                            'No',
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.red,
                          onPressed: () => addPreviousTasks(false),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 48.0,
                    ),
                  ]
                : <Widget>[
                    freshList
                        ? Icon(
                            Icons.check,
                            size: 46.0,
                            color: Colors.green,
                          )
                        : Icon(
                            Icons.add_box,
                            size: 46.0,
                            color: Colors.blueAccent,
                          ),
                    SizedBox(
                      height: 15,
                    ),
                    freshList
                        ? Text(
                            'All Tasks Completed',
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.w500),
                          )
                        : Text(
                            'Please add a task to begin...',
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.w500),
                          ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
          ),
        ),
      ],
    );
  }
}
