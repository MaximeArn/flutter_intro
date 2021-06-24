import 'package:flutter/material.dart';
import 'package:widgets_tests/models/activity_model.dart';

class TripActivitiesList extends StatelessWidget {
  final List<Activity> activities;

  TripActivitiesList({required this.activities});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: activities.length,
      itemBuilder: (BuildContext context, int index) {
        Activity activity = activities[index];
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Dismissible(
              direction: DismissDirection.endToStart,            
              background: Container(
                child: Center(child: Text("done !", style: TextStyle(color: Colors.white, fontSize: 20),)),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: Colors.green),
              ),
              key: ValueKey(activity.id),
              child: Card(
                child: ListTile(
                  title: Text(activity.name),
                ),
              )),
        );
      },
    );
  }
}
