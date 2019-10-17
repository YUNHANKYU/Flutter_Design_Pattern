import 'package:strategy_pattern/user_strategy.dart';

class User {
  UserStrategy whoAreYou;
  String name;

  User(this.name, this.whoAreYou);
}