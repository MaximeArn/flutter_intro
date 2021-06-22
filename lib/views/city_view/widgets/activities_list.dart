import 'package:flutter/material.dart';
import 'package:widgets_tests/models/activity_model.dart';
import 'package:widgets_tests/views/city_view/widgets/activity_card.dart';

class ActivitiesList extends StatelessWidget {
  final List<Activity> activities;
  final void Function(Activity) toggleActivity;
  final List<Activity> selectedActivities;

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
            .map((Activity activity) => ActivityCard(
                activity: activity,
                isSelected: selectedActivities.contains(activity),
                toggleActivity: () {
                  toggleActivity(activity);
                }))
            .toList());
  }
}
