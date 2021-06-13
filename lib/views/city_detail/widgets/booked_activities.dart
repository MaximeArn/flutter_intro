import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:widgets_tests/models/activity.type.dart';

class BookedActivities extends StatelessWidget {
  final List<Activity> bookedActivities;
  final void Function(String) unBookActivity;

  BookedActivities(
      {required this.bookedActivities, required this.unBookActivity});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2, vertical: 6),
      child: ListView.builder(
        itemBuilder: (context, index) {
          Activity activity = bookedActivities[index];
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(activity.image),
              ),
              title: Text(activity.name),
              subtitle: Text(activity.city),
              trailing: IconButton(
                onPressed: () {
                  unBookActivity(activity.id);
                },
                icon: Icon(Icons.delete),
              ),
            ),
          );
        },
        itemCount: bookedActivities.length,
      ),
    );
  }
}
