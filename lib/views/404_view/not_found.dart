import 'package:flutter/material.dart';

class NotFound extends StatelessWidget {
  const NotFound();

  @override
  Widget build(context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Text("something went wrong !"),
      ),
    );
  }
}
