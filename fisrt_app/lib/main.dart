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
         height: 150,
          width: 150
        ),
        Expanded(
          child: Container(
            color: Colors.green,
            width: 150
          ),
        ),
        Expanded(child: 
        Container(
          color: Colors.blue,
          height: 150,
          width: 150
        ),
        ),
        Container(
          color: Colors.yellow,
         height: 150,
          width: 150
        )
      ],
    );
  }
}
