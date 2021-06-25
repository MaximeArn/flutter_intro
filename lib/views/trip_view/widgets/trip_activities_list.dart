import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widgets_tests/models/activity_model.dart';
import 'package:widgets_tests/providers/trip_provider.dart';

class TripActivitiesList extends StatelessWidget {
  final List<Activity> activities;
  final ActivityStatus filter;

  TripActivitiesList({required this.activities, required this.filter});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: activities.length,
      itemBuilder: (BuildContext context, int index) {
        Activity activity = activities[index];
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: filter == ActivityStatus.comming
              ? Dismissible(
                  direction: DismissDirection.endToStart,
                  background: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 30,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          colors: [Colors.green.shade700, Colors.green],
                        )),
                  ),
                  key: ValueKey(activity.id),
                  child: Card(
                    child: ListTile(
                      title: Text(activity.name),
                    ),
                  ),
                  onDismissed: (_) {
                    Provider.of<TripProvider>(context, listen: false)
                        .setActivityToDone(activity);
                  },
                )
              : Card(
                  child: ListTile(
                    title: Text(activity.name,
                        style: TextStyle(color: Colors.grey)),
                  ),
                ),
        );
      },
    );
  }
}
