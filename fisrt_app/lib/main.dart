import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("CooKing", 
        textDirection: TextDirection.ltr,
        style: TextStyle(
         fontSize: 50,
         color: Color(0xfce5cdff),
         fontWeight: FontWeight.w500
        ),
      )
    );
  }
}
