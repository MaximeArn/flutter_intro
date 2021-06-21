import 'package:flutter/material.dart';
import 'package:widgets_tests/widgets/drawer.dart';

class TripsView extends StatefulWidget {
  static const String routeName = "/trips";

  @override
  _TripsViewState createState() => _TripsViewState();
}

class _TripsViewState extends State<TripsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Trips"),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text("Trips"),
      ),
    );
  }
}
