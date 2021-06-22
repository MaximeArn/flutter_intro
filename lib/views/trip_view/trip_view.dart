import 'package:flutter/material.dart';
import 'package:widgets_tests/models/city_model.dart';
import 'package:widgets_tests/models/trip_model.dart';

class TripView extends StatefulWidget {
  static const String routeName = "/trip";
  final Trip trip;
  final City city;

  TripView({required this.city, required this.trip});

  @override
  _TripViewState createState() => _TripViewState();
}

class _TripViewState extends State<TripView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Trip Detail Here !!"),
      ),
    );
  }
}
