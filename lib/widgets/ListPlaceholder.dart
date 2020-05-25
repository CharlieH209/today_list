import 'package:flutter/material.dart';

class ListPlaceholder extends StatelessWidget {
  final bool freshList;

  ListPlaceholder(this.freshList);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
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
                      'Tasks Completed',
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
        ],
      ),
    );
  }
}
