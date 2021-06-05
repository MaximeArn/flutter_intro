import 'Human.dart';
export "Human.dart";

class User<T> extends Human {
  String name;
  String password;
  T preferedType;
  String get cryptedPassword {
    return (this.password + " crypted");
  }

  User(
      {required String this.name,
      required String this.password,
      required this.preferedType})
      : super(sex: "male") {}

  @override
  void speak() {
    print("hello I am a user  !");
  }

  static void speakFrench() {
    print("bonjour toi !");
  }
}
