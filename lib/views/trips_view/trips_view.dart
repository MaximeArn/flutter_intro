import 'package:flutter/material.dart';
import 'package:widgets_tests/models/trip_model.dart';
import 'package:widgets_tests/views/trips_view/widgets/trip_list.dart';
import 'package:widgets_tests/widgets/drawer.dart';

class TripsView extends StatefulWidget {
  static const String routeName = "/trips";
  final List<Trip> trips;

  TripsView({required this.trips});

  @override
  _TripsViewState createState() => _TripsViewState();
}

class _TripsViewState extends State<TripsView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("My Trips"),
        ),
        drawer: MainDrawer(),
        body: TripList(trips: widget.trips),
      ),
    );
  }
}
