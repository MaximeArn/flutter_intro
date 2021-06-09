import 'package:flutter/material.dart';
import 'package:widgets_tests/models/Activity.type.dart';
import 'package:widgets_tests/views/city_detail/widgets/activity_card.dart';
import '../../data/data.dart' as data;

class CityDetail extends StatefulWidget {
  final List<Activity> activities = data.activities;

  @override
  _CityDetailState createState() => _CityDetailState();
}

class _CityDetailState extends State<CityDetail> {
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
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
        child: Column(
          children: widget.activities
              .map((Activity activity) => ActivityCard(activity: activity))
              .toList(),
        ),
      ),
    );
  }
}
