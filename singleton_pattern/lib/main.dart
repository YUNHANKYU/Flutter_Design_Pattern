import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:singleton_pattern/second.dart';
import 'package:singleton_pattern/user_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Singleton Pattern Example",
      theme: ThemeData(appBarTheme: AppBarTheme(color: Colors.red), primaryColor: Colors.pinkAccent),
      home: My(),
    );
  }
}

class My extends StatefulWidget {
  @override
  _MyState createState() => _MyState();
}

class _MyState extends State<My> {
  User hankyu = User();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Singleton Pattern Example"),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(50,200,50,0),
        child: Column(
          children: <Widget>[
            Container(
              width: 310,
              height: 50,
              child: RaisedButton(
                child: Text("GO to SECOND", style: TextStyle(fontSize: 25, color: Colors.white),),
                onPressed: (){
                  print("Button Pressed");
                  goToDetail();
                },
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
  goToDetail() {

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Second(firstUser: hankyu,)),
    );
  }
}




