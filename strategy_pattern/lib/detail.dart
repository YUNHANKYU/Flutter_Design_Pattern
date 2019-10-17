import 'package:flutter/material.dart';
import 'package:strategy_pattern/user_model.dart';

@immutable
class Detail extends StatelessWidget {
  final User roll;

  Detail({@required this.roll});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Image.asset('assets/${roll.whoAreYou.request()}.jpg'),
            Container(
              padding: EdgeInsets.fromLTRB(50, 30, 50, 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("이름 : ${roll.name}", style: TextStyle(fontSize: 30, color: Colors.greenAccent),),
                  Text("직업 : ${roll.whoAreYou.request()}", style: TextStyle(fontSize: 30, color: Colors.greenAccent)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
