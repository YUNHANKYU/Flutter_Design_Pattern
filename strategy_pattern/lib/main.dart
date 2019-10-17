import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:strategy_pattern/detail.dart';
import 'package:strategy_pattern/user_model.dart';
import 'package:strategy_pattern/user_strategy.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Strategy Pattern Example",
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
  TextEditingController textEditingController = TextEditingController();
  var roll;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Strategy Pattern Example"),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(50,200,50,0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: textEditingController,
              onChanged: (text){
                print(text);
              },
              style: TextStyle(fontSize: 40),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 310,
              height: 50,
              child: RaisedButton(
                child: Text("GO", style: TextStyle(fontSize: 25, color: Colors.white),),
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

    switch(textEditingController.text){
      case "student":
        roll = StudentStrategy();
        break;
      case "professor":
        roll = ProfessorStrategy();
        break;
      case "parent":
        roll = ParentStrategy();
        break;
      default:
        roll = AdminStrategy();
    }
    var me = User("Hankyu", roll);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Detail(roll: me)),
    );

    final String website = "Hisnet";

    print("Hey ${me.name}, when you log in to Hisnet the website will tell you who you are.");
    print("Beap! ${me.whoAreYou.request()}!\r\n");
  }
}




