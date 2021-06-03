main() {
  var list = [1, 2, 3, 3, 3, 4, "str", true];
  // list is typed by inference as in typescript
  List<double> list2 = [
    3.4,
    24,
    5,
  ];
  List<Object> list3 = [
    1,
    "str",
    true,
    [1, 2, 3]
  ];
  //list3 will accept all types because all types extends from Object class
  list3.add(5);
  List<int> intList = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  intList.remove(3);
  print(intList);

  //remove a element
  intList.removeAt(0);

  print(intList);
  //remove at an index

  intList.forEach((element) {
    print(element == 4);
  });

  var squareIntList = intList.map((e) => e*e);
  print(squareIntList);
}
