import "dart:async";

void main(List<String> args) {
  Future<String> f = Future<String>.delayed(Duration(seconds: 3), () {
    // return "finish";
    throw Exception("big error");
  });

  // Works as with promises
  f.then((res) {
    print(res); //finish
  }).catchError((err) {
    print(err); // big error
  });

//will be executed in first
  print("hello");
}
