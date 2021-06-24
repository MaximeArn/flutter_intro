import 'package:flutter/material.dart';
import 'package:widgets_tests/models/activity_model.dart';
import 'package:widgets_tests/views/trip_view/widgets/trip_activities_list.dart';

class TripActivities extends StatelessWidget {
  final List<Activity> activities;

  TripActivities({required this.activities});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Container(
              color: Theme.of(context).primaryColor,
              child: TabBar(
                indicatorColor: Colors.blue.shade100,
                tabs: [
                Tab(
                  child: Text("Comming"),
                ),
                Tab(
                  child: Text("past"),
                )
              ]),
            ),
            Container(
              height: 600,
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  TripActivitiesList(activities: activities),
                  TripActivitiesList(activities: activities)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
