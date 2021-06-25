import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widgets_tests/models/trip_model.dart';
import 'package:widgets_tests/providers/trip_provider.dart';
import 'package:widgets_tests/views/trips_view/widgets/trip_list.dart';
import 'package:widgets_tests/widgets/drawer.dart';

class TripsView extends StatelessWidget {
  static const String routeName = "/trips";

  List<Trip> pastTrips(List<Trip> trips){
    return trips
        .where((Trip trip) => trip.date.isBefore(DateTime.now()))
        .toList();
  }

  List<Trip> commingTrips(List<Trip> trips){
    return trips
        .where((Trip trip) => trip.date.isAfter(DateTime.now()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {

  List<Trip> trips = Provider.of<TripProvider>(context).trips;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: const Text("My Trips"),
            bottom: const TabBar(
              tabs: [
                const Tab(
                  text: "Coming",
                ),
                const Tab(
                  text: "Past",
                ),
              ],
            ),
          ),
          drawer: const MainDrawer(),
          body: TabBarView(
            children: [
              TripList(trips: commingTrips(trips)),
              TripList(trips: pastTrips(trips))
            ],
          )),
    );
  }
}
