import 'package:flutter/material.dart';
import 'package:widgets_tests/models/activity_model.dart';

class Trip {
  String city;
  List<Activity> activities;
  DateTime date;
  String id;

  Trip({
    required this.activities,
    required this.city,
    required this.date,
  }) : id = UniqueKey().toString();
}
