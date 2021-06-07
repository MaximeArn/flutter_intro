import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      textDirection: TextDirection.ltr,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(color: Colors.red, height: 100, width: 100),
        Expanded(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          textDirection: TextDirection.ltr,
          children: [
            Container(
              color: Colors.green.shade200,
              width: 50,
            ),
            Expanded(
              child: Container(
                color: Colors.green.shade300,
                width: 100,
              ),
            ),
            Container(
              color: Colors.green.shade400,
              width: 50,
            ),
          ],
        )),
        Expanded(
          child: Container(color: Colors.blue, height: 100, width: 100),
        ),
        Container(color: Colors.yellow, height: 100, width: 100)
      ],
    );
  }
}
