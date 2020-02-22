import 'package:flutter/material.dart';

import 'todo.dart';

class ToDoItem extends StatefulWidget {
  ToDoItem(this.todo);
  ToDo todo;

  @override
  _ToDoItemState createState() => _ToDoItemState(todo);
}

class _ToDoItemState extends State<ToDoItem> {
  ToDo _todo;
  _ToDoItemState(ToDo todo) {
    this._todo = todo;
  }

  final _descTextStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontFamily: 'Roboto',
    letterSpacing: 0.5,
    fontSize: 18.0,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Container(
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: DefaultTextStyle(
                style: _descTextStyle,
                child: Text(
                  'sdlfkjsldk;fjlk;sjflksdjfl;ksdjafkljsdlk;fj;lkasjflk;asdjflkjasd;lkfj;lasjf;lksjflk;jsdlkjfsd;lk: ${_todo.name}',
                  softWrap: true,
                ),
              ),
            ),
          ),
          color: Colors.tealAccent,
        ),
      ),
      color: Colors.white70,
    );
  }
}
