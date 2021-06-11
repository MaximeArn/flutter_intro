import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:widgets_tests/models/activity.type.dart';
import 'package:widgets_tests/models/trip.type.dart';
import 'package:widgets_tests/views/city_detail/widgets/activity_card.dart';
import '../../data/data.dart' as data;

class CityDetail extends StatefulWidget {
  final List<Activity> activities = data.activities;

  @override
  _CityDetailState createState() => _CityDetailState();
}

class _CityDetailState extends State<CityDetail> {
  Trip myTrip = Trip(activities: [], city: "Paris", date: DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: Icon(Icons.chevron_left),
            title: Text("Paris"),
            actions: <Widget>[
              Icon(Icons.more_vert),
            ]),
        body: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                height: 150,
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(child: Text(DateFormat("d/M/y").format(myTrip.date))),
                        ElevatedButton(
                          child: Text("Selectionnez une date "),
                          onPressed: () {},
                        )
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                child: GridView.count(
                    mainAxisSpacing: 1,
                    crossAxisSpacing: 1,
                    crossAxisCount: 2,
                    children: widget.activities
                        .map((Activity activity) =>
                            ActivityCard(activity: activity))
                        .toList()),
              ),
            ],
          ),
        ));
  }
}
