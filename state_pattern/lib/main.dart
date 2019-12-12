import 'states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  NoteBook noteBook;
  Color textColor;

  @override
  void initState() {
    super.initState();
    noteBook = NoteBook(Off());
    textColor = Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "State Pattern Example",
      theme: ThemeData(
        primaryColor: noteBook.bgColor,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("State Pattern Example"),
        ),
        body: Container(
          color: noteBook.bgColor,
          child: Column(
            children: <Widget>[
              Flexible(
                flex: 3,
                child: Container(),
              ),
              Flexible(
                  flex: 1,
                  child: Center(
                      child: Text(
                          noteBook.state.toString(),
                        style: TextStyle(
                          fontSize: 40.0,
                          color: textColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                  )),
              Flexible(
                flex: 6,
                child: Container(),
              ),
              Flexible(
                flex: 3,
                child: Center(
                  child: IconButton(
                    iconSize: 70.0,
                    icon: Icon(Icons.fingerprint, color: textColor,),
                    onPressed: () {
                      noteBook.powerPush();
                      setState(() {
                        textColor = Colors.white;
                      });
                    },
                  ),
                ),
              ),
              Flexible(
                flex: 5,
                child: Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}