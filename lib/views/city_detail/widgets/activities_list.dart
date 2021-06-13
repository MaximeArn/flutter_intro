import 'package:flutter/material.dart';
import 'package:widgets_tests/models/activity.type.dart';
import 'package:widgets_tests/views/city_detail/widgets/activity_card.dart';

class ActivitiesList extends StatelessWidget {
  final List<Activity> activities;
  final void Function(String) toggleActivity;
  final List<String> selectedActivities;

  ActivitiesList(
      {required this.activities,
      required this.toggleActivity,
      required this.selectedActivities});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
        crossAxisCount: 2,
        children: activities
            .map((Activity activity) => ActivityCard(activity: activity))
            .toList());
  }
}
