main(List<String> args) {
  String hello(String str1, String str2, [String str3 = " !"]) {
    return str1 + str2 + str3;
  }
  // the type is the return type of the func

  print(hello("hello", " world"));
}
