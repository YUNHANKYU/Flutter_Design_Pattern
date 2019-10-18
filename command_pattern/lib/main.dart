import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


abstract class Receiver {
  Set<String> get actions;
}

abstract class Command {
  Receiver receiver;
  String name;

  Command(this.receiver);

  @override
  String toString() => this.name;

  void execute();
}

class Invoker {
  List<String> history = [];
  void execute(Command cmd) {
    cmd.execute();
    history.add("[${DateTime.now()}] Executed $cmd");
  }

  @override
  String toString() => history.fold("", (events, event) => events + "$event\r\n");
}

class TurnOffCommand extends Command {
  String name = "Turn off";
  TurnOffCommand(Light light): super(light);
  void execute() {
    (receiver as Light).turnOff();
  }
}

class TurnOnCommand extends Command {
  String name = "Turn on";
  TurnOnCommand(Light light): super(light);
  void execute() {
    (receiver as Light).turnOn();
  }
}

class Light implements Receiver {
  void turnOff() => print("Light off!");
  void turnOn() => print("Light on!");
  Set<String> get actions => Set.from(["off", "on"]);
}

class LightSwitch {
  Invoker _switch = Invoker();
  Light light;

  LightSwitch(this.light);

  String get history => _switch.toString();

  void perform(String action) {
    if (!light.actions.contains(action)) {
      return print("Uh...wait, wut?");
    }
    switch(action) {
      case "on": return _switch.execute(TurnOnCommand(light));
      case "off": return _switch.execute(TurnOffCommand(light));
    }
  }
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Command Pattern Example",
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
  static var myFavoriteLamp = Light();
  var iotLightSwitch = LightSwitch(myFavoriteLamp);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Command Pattern Example"),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(50,200,50,0),
        child: Column(
          children: <Widget>[
            Container(
              width: 310,
              height: 50,
              child: RaisedButton(
                child: Text("ON", style: TextStyle(fontSize: 25, color: Colors.white),),
                onPressed: (){
                  print("Button Pressed");
                  iotLightSwitch.perform("on");
                },
                color: Colors.red,
              ),
            ),Container(
              width: 310,
              height: 50,
              child: RaisedButton(
                child: Text("OFF", style: TextStyle(fontSize: 25, color: Colors.white),),
                onPressed: (){
                  print("Button Pressed");
                  iotLightSwitch.perform("off");
                },
                color: Colors.red,
              ),
            ),Container(
              width: 310,
              height: 50,
              child: RaisedButton(
                child: Text("--", style: TextStyle(fontSize: 25, color: Colors.white),),
                onPressed: (){
                  print("Button Pressed");
                  iotLightSwitch.perform("blink");
                },
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}




