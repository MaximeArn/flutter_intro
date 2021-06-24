import 'package:flutter/material.dart';
import 'package:widgets_tests/models/activity_model.dart';

class TripActivitiesList extends StatelessWidget {
  final List<Activity> activities;

  TripActivitiesList({required this.activities});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: activities.length,
      itemBuilder: (BuildContext context, int index) =>
          Text(activities[index].name),
    );
  }
}
