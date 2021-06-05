main(List<String> args) {
  int count = 10;

  for (var i = 0; i < count; i++) {
    print(i);
  }

  count = 0;
  while (count < 10) {
    print(count);
    count++;
  }

  count = 0;
  do {
    count++;
    print(count);
  } while (count < 10);

  // ternaire

  int five = 5;
  bool isEqual5 = five == 5 ? true : false;
  print(isEqual5);
}
