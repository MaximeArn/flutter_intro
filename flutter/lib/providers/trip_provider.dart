import 'dart:collection';
import 'package:widgets_tests/models/activity_model.dart';
import 'package:flutter/material.dart';
import 'package:widgets_tests/models/trip_model.dart';

class TripProvider with ChangeNotifier {
  List<Trip> _trips = [];

  UnmodifiableListView<Trip> get trips => UnmodifiableListView(_trips);

  void addTrip(Trip trip) {
    _trips.add(trip);
    notifyListeners();
  }

  Trip getTripById(String id) =>
      _trips.firstWhere((Trip trip) => trip.id == id);

  void setActivityToDone(Activity activity) {
    activity.status = ActivityStatus.past;
    notifyListeners();
  }
}
