class User {
  static final User _singleton = new User._internal();
  static String _name;

  factory User() {
    return _singleton;
  }

  static String get name => _name;

  @override
  String toString() => "Hello, my name is $name.";

  User._internal(){
    _name = "HANKYU";
  }
}

void main() {
  // 두 변수에 따로 User객체 선언
  var tyler = User();
  var anotherTyler = User();

  print(tyler);
  print(anotherTyler);

  //identical(object1, object2) : 두 object가 같은 object인지 판별.
  var samenessCheck = identical(tyler, anotherTyler)
      ? "We are both the same ${User.name}."
      : "We are NOT the same. I mean, just look at us.";
  print(samenessCheck);
}