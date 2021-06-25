import 'dart:collection';
import "../data/data.dart" as data;
import 'package:flutter/material.dart';
import 'package:widgets_tests/models/trip_model.dart';

class TripProvider with ChangeNotifier {
  List<Trip> _trips = data.trips;

  UnmodifiableListView<Trip> get trips => UnmodifiableListView(_trips);
}
