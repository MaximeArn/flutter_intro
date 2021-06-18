import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:widgets_tests/models/activity_model.dart';
import 'package:widgets_tests/models/city_model.dart';
import 'package:widgets_tests/models/trip_model.dart';
import 'package:widgets_tests/views/city_detail/widgets/activities_list.dart';
import 'package:widgets_tests/views/city_detail/widgets/booked_activities.dart';
import 'package:widgets_tests/views/city_detail/widgets/trip_overview.dart';
import '../../data/data.dart' as data;

class CityDetail extends StatefulWidget {
  final List<Activity> activities = data.activities;

  Widget showContext(
      {required BuildContext context, required List<Widget> children}) {
    Orientation orientation = MediaQuery.of(context).orientation;
    if (orientation == Orientation.landscape) {
      return Row(
        children: children,
        crossAxisAlignment: CrossAxisAlignment.stretch,
      );
    } else {
      return Column(
        children: children,
      );
    }
    ;
  }

  @override
  _CityDetailState createState() => _CityDetailState();
}

class _CityDetailState extends State<CityDetail> with WidgetsBindingObserver {
  late Trip myTrip;
  late int index;
  late List<Activity> activities;

  List<Activity> get bookedActivities {
    return activities
        .where((activity) => myTrip.activities.contains(activity.id))
        .toList();
  }

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
  void dispose() {
    super.dispose();
    WidgetsBinding.instance!.removeObserver(this);
  }

  @override
  void initState() {
    activities = data.activities;
    WidgetsBinding.instance!.addObserver(this);
    myTrip = Trip(activities: [], city: "Paris", date: DateTime.now());
    index = 0;
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print(state);
  }

  void changeIndex(newIndex) {
    setState(() {
      index = newIndex;
    });
  }

  void toggleActivity(String id) {
    setState(() {
      myTrip.activities.contains(id)
          ? myTrip.activities.remove(id)
          : myTrip.activities.add(id);
    });
  }

  void unBookActivity(String id) {
    setState(() {
      myTrip.activities.remove(id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final City city = ModalRoute.of(context)!.settings.arguments as City;

    return Scaffold(
      appBar: AppBar(
          leading: Icon(Icons.chevron_left),
          title: Text("Organize your trip"),
          actions: <Widget>[
            Icon(Icons.more_vert),
          ]),
      body: Container(
          child: widget.showContext(context: context, children: [
        TripOverview(
          myTrip: myTrip,
          setDate: setDate,
          cityName: city.name,
        ),
        Expanded(
          child: index == 0
              ? ActivitiesList(
                  activities: activities,
                  toggleActivity: toggleActivity,
                  selectedActivities: myTrip.activities,
                )
              : BookedActivities(
                  bookedActivities: bookedActivities,
                  unBookActivity: unBookActivity,
                ),
        ),
      ])),
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
