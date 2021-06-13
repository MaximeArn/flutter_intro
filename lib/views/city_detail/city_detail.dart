import 'package:flutter/material.dart';
import 'package:widgets_tests/models/activity.type.dart';
import 'package:widgets_tests/models/trip.type.dart';
import 'package:widgets_tests/views/city_detail/widgets/activities_list.dart';
import 'package:widgets_tests/views/city_detail/widgets/booked_activities.dart';
import 'package:widgets_tests/views/city_detail/widgets/trip_overview.dart';
import '../../data/data.dart' as data;

class CityDetail extends StatefulWidget {
  final List<Activity> activities = data.activities;

  @override
  _CityDetailState createState() => _CityDetailState();
}

class _CityDetailState extends State<CityDetail> {
  late Trip myTrip;
  late int index;

  void setDate() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime(2023))
        .then((date) {
      if (date != null) {
        setState(() {
          myTrip.date = date;
        });
      }
    });
  }

  @override
  void initState() {
    myTrip = Trip(activities: [], city: "Paris", date: DateTime.now());
    index = 0;
    super.initState();
  }

  void changeIndex(newIndex) {
    setState(() {
      index = newIndex;
    });
  }

  void toggleActivity(String id) {
    myTrip.activities.contains(id)
        ? myTrip.activities.remove(id)
        : myTrip.activities.add(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Icon(Icons.chevron_left),
          title: Text("Organize your trip"),
          actions: <Widget>[
            Icon(Icons.more_vert),
          ]),
      body: Container(
        child: Column(
          children: [
            TripOverview(myTrip: myTrip, setDate: setDate),
            Expanded(
                child: index == 0
                    ? ActivitiesList(activities: widget.activities, toggleActivity: toggleActivity,)
                    : BookedActivities()),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.map), label: "discovery"),
          BottomNavigationBarItem(
            icon: Icon(Icons.stars),
            label: "booking",
          )
        ],
        onTap: (newIndex) {
          setState(() {
            changeIndex(newIndex);
          });
        },
        currentIndex: index,
      ),
    );
  }
}
