import 'package:flutter/material.dart';

import 'todo.dart';
import 'todo_item.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<ToDo> _todoList = [];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.black87,
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                    itemCount: _todoList.length,
                    itemBuilder: (context, int index) {
                      return Padding(
                        padding: EdgeInsets.all(5),
                        child: ToDoItem(
                          _todoList[index],
                        ),
                      );
                    },
                  ),
                )
              ],
            )
          ],
        ),
      ),
      backgroundColor: Colors.tealAccent,
    );
  }

  @override
  void initState() {
    super.initState();
    _setUp();
  }

  void _setUp() async {
    final data = await ToDo.todos();
    setState(() {
      _todoList = data;
    });
    await ToDo.insertToDo(ToDo(null, 'name', 'description'));
  }
}
