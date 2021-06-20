import 'package:flutter/material.dart';
import 'package:widgets_tests/models/activity_model.dart';
import 'package:widgets_tests/views/city_view/widgets/booked_activity_card.dart';

class BookedActivities extends StatelessWidget {
  final List<Activity> bookedActivities;
  final void Function(String) unBookActivity;

  BookedActivities(
      {required this.bookedActivities, required this.unBookActivity});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 2, vertical: 6),
        child: ListView(
            children: bookedActivities
                .map((activity) => BookedActivityCard(
                      key: ValueKey(activity.id),
                      activity: activity,
                      unBookActivity: unBookActivity,
                    ))
                .toList()));
  }
}
