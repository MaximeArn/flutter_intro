import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:widgets_tests/models/trip_model.dart';

class TripList extends StatelessWidget {
  final List<Trip> trips;

  TripList({required this.trips});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: trips.length,
      itemBuilder: (BuildContext context, int index) {
        Trip trip = trips[index];
        return ListTile(
          title: Text(trip.city),
          subtitle: Text(
            DateFormat("d/M/y").format(trip.date),
            style: const TextStyle(letterSpacing: 1.1),
          ),
          trailing: const Icon(Icons.info),
        );
      },
    );
  }
}
