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
        Container(
          color: Colors.red,
         height: 100,
          width: 100
        ),
        Expanded(
          child: Container(
            color: Colors.green,
            width: 100
          ),
        ),
        Expanded(child: 
        Container(
          color: Colors.blue,
          height: 100,
          width: 100
        ),
        ),
        Container(
          color: Colors.yellow,
         height: 100,
          width: 100
        )
      ],
    );
  }
}
