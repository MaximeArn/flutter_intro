//only import a part of a file
import 'User.dart' show User;

// native dart package
import 'dart:math';

main(List<String> args) {
  User<String> john =
      User(name: "john", password: "12345", preferedType: "strings");

  print(john.cryptedPassword);
  john.speak();

  //generic typed prop
  print(john.preferedType.runtimeType); //String

  //herited property
  print(john.eys);

  //static method
  User.speakFrench();

  print(pi);
}
