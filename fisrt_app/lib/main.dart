import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Image(
      image: AssetImage("assets/flutter.png"),
      width: 300,
      height: 100,
      color: Colors.yellow.shade400,
      //     Text.rich(
      //   TextSpan(children: [
      //     TextSpan(text: "Coo"),
      //     TextSpan(
      //       text: "K",
      //       style: TextStyle(
      //         color: Color.fromRGBO(255, 215, 0, 1),
      //       ),
      //     ),
      //     TextSpan(text: "ing")
      //   ]),
      //   textDirection: TextDirection.ltr,
      //   style: TextStyle(fontSize: 50, fontWeight: FontWeight.w500),
      // )
    ));
  }
}
