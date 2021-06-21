import 'package:flutter/material.dart';

class TripsView extends StatefulWidget {
  static const String routeName = "/trips";

  @override
  _TripsViewState createState() => _TripsViewState();
}

class _TripsViewState extends State<TripsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Trips"),
      ),
    );
  }
}
