import 'package:flutter/material.dart';
import 'package:singleton_pattern/user_model.dart';

@immutable
class Second extends StatelessWidget {
  final User firstUser;
  User anotherHankyu = User();

  Second({@required this.firstUser});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.fromLTRB(30, 50, 30, 50),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 80,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "첫 번째 페이지 유저",
                    style: TextStyle(fontSize: 30),
                  ),
                  Text("이름 : ${firstUser.name}"),
                  Text("나이 : ${firstUser.age}"),
                  Text("이메일 : ${firstUser.email}"),
                ],
              ),
              SizedBox(
                height: 120,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "두 번째 페이지 유저",
                    style: TextStyle(fontSize: 30),
                  ),
                  Text("이름 : ${anotherHankyu.name}"),
                  Text("나이 : ${anotherHankyu.age}"),
                  Text("이메일 : ${anotherHankyu.email}"),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                  "두 페이지의 유저는 ${identical(firstUser, anotherHankyu) ? "같습니다~~" : "다릅니다."}",
              style: TextStyle(fontSize: 20, color: Colors.red),),
            ],
          ),
        ),
      ),
    );
  }
}
