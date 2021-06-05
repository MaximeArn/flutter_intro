class Human {
  String sex;
  int eys = 2;
  int mouse = 1;

  Human({required this.sex}) {}

  void speak() {
    print("hello I am an Human");
  }
}

//adding an underscore before the name of the class make it unexportable !!

// class _Human {
//   String sex;
//   int eys = 2;
//   int mouse = 1;

//   _Human({required this.sex}) {}

//   void speak() {
//     print("hello I am an Human");
//   }
// }
