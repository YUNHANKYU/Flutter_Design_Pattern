import 'package:flutter/material.dart';

abstract class PowerState {
  void handler(NoteBook context);
  String toString();
}

class Off implements PowerState {
  handler(NoteBook context) {
    context.bgColor = Colors.tealAccent;
    context.state = On();
  }

  @override String toString() {
    return "전원 OFF";
  }
}

class On implements PowerState {
  handler(NoteBook context) {
    context.bgColor = Colors.deepOrange;
    context.state = Saving();
  }

  @override String toString() {
    return "전원 ON";
  }
}

class Saving implements PowerState {
  handler(NoteBook context) {
    context.bgColor = Colors.black;
    context.state = Off();
  }

  @override String toString() {
    return "절전 모드";
  }
}

class NoteBook {
  PowerState _state;
  Color bgColor = Colors.black;

  NoteBook(this._state);

  PowerState get state => _state;
  set state(PowerState newState) => _state = newState;

  void powerPush() {
    _state.handler(this);
  }
}