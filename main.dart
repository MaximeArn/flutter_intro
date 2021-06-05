class Human {
  String sex;
  int eys = 2;
  int mouse = 1;

  Human({required this.sex}) {}

  void speak() {
    print("hello I am an Human");
  }
}

class User extends Human {
  String name;
  String password;
  String get cryptedPassword {
    return (this.password + " crypted");
  }

  User({required String this.name, required String this.password})
      : super(sex: "male") {}

@override
  void speak() {
    print("hello I am a user  !");
  }

  static void speakFrench() {
    print("bonjour toi !");
  }
}

main(List<String> args) {
  User john = User(name: "john", password: "12345");

  print(john.cryptedPassword);
  john.speak();

  //herited property
  print(john.eys);

  //static method
  User.speakFrench();
}
