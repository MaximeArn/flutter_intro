import "dart:async";

Future getData() {
  // return Future.value('I am a data');
  throw Exception("error");
}

void main(List<String> args) async {
  try {
    var data = await getData();
    print(data); // 'I am a data'
  } catch (err) {
    print(err); // Exception: error
  }

//will be executed in first
  print("hello");
}
