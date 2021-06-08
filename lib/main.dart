import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(TravelApp());
}

class TravelApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        //disable horrible banner ^^
        debugShowCheckedModeBanner: false,
        home: Home());
  }
}
