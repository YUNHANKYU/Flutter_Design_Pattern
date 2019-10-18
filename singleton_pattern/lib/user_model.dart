class User {
  static final User _singleton = new User._internal();
  static String _name;
  static int _age;
  static String _email;

  factory User() {
    return _singleton;
  }

  String get name => _name;

  int get age => _age;

  String get email => _email;

  @override
  String toString() => "Hello, my name is $name.\n"
      "I'm $age years old.\n"
      "My email address is $email.\n";

  User._internal() {
    _name = "HANKYU";
    _age = 24;
    _email = "bhgt4563@gmail.com";
  }
}
