import 'package:flutter/material.dart';
import 'package:widgets_tests/models/activity_model.dart';
import 'package:widgets_tests/views/trip_view/widgets/trip_activities_list.dart';

class TripActivities extends StatelessWidget {
  final String tripId;

  TripActivities({required this.tripId});

  @override
  Widget build(BuildContext context) {
    print("build 2");
    return Container(
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Container(
              color: Theme.of(context).primaryColor,
              child: TabBar(indicatorColor: Colors.blue.shade100, tabs: [
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
                  TripActivitiesList(
                    tripId: tripId,
                    filter: ActivityStatus.comming,
                  ),
                  TripActivitiesList(
                     tripId: tripId,
                      filter: ActivityStatus.past)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
