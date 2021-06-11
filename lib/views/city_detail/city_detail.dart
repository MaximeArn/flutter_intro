import 'package:flutter/material.dart';
import 'package:widgets_tests/models/activity.type.dart';
import 'package:widgets_tests/models/trip.type.dart';
import 'package:widgets_tests/views/city_detail/widgets/activities_list.dart';
import 'package:widgets_tests/views/city_detail/widgets/activity_card.dart';
import 'package:widgets_tests/views/city_detail/widgets/trip_overview.dart';
import '../../data/data.dart' as data;

class CityDetail extends StatefulWidget {
  final List<Activity> activities = data.activities;

  @override
  _CityDetailState createState() => _CityDetailState();
}

class _CityDetailState extends State<CityDetail> {
  Trip myTrip = Trip(activities: [], city: "Paris", date: DateTime.now());

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
            Expanded(child: ActivitiesList(activities: widget.activities)),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.map), label: "discovery"),
          BottomNavigationBarItem(icon: Icon(Icons.stars), label: "booking"),
        ],
      ),
    );
  }
}
