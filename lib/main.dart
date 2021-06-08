import 'package:flutter/material.dart';

void main() {
  runApp(TravelApp());
}

class TravelApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //disable horrible banner ^^
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.home),
          title: Text("Travel"),
          actions: <Widget>[Icon(Icons.more_vert)],
        ),
        body: Container(
          child: Text("travel"),
        ),
      ),
    );
  }
}
