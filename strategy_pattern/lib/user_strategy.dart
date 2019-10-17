abstract class UserStrategy {
  String request();
}

class StudentStrategy implements UserStrategy {
  String request() => "student";
}

class ProfessorStrategy implements UserStrategy {
  String request() => "professor";
}

class ParentStrategy implements UserStrategy {
  String request() => "parent";
}

class AdminStrategy implements UserStrategy {
  String request() => "admin";
}