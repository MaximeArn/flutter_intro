import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:widgets_tests/models/activity_model.dart';
import 'package:widgets_tests/models/city_model.dart';
import 'package:widgets_tests/models/trip_model.dart';
import 'package:widgets_tests/views/city_view/widgets/activities_list.dart';
import 'package:widgets_tests/views/city_view/widgets/booked_activities.dart';
import 'package:widgets_tests/views/city_view/widgets/trip_overview.dart';
import 'package:widgets_tests/widgets/ask_modal.dart';
import '../../data/data.dart' as data;

class CityView extends StatefulWidget {
  static String routeName = "/city";
  final List<Activity> activities = data.activities;
  final City city;

  CityView({required this.city});

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
  }

  @override
  _CityViewState createState() => _CityViewState();
}

class _CityViewState extends State<CityView> {
  late Trip myTrip;
  late int index;
  late List<Activity> activities;

  List<Activity> get bookedActivities {
    return activities
        .where((activity) => myTrip.activities.contains(activity.id))
        .toList();
  }

  @override
  void initState() {
    activities = data.activities;
    myTrip = Trip(activities: [], city: widget.city.name, date: DateTime.now());
    index = 0;
    super.initState();
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

  double get amount {
    return myTrip.activities.fold(0, (previousValue, element) {
      Activity activity = widget.activities
          .firstWhere((Activity activity) => activity.id == element);
      return previousValue + activity.price;
    });
  }

  void saveTrip() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text("Save this trip ?", textAlign: TextAlign.center,),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: () {}, child: Text("Yes")),
                  ElevatedButton(onPressed: () {}, child: Text("No"))
                ],
              )
            ],
          );
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
        ],
      ),
      body: Container(
        child: widget.showContext(
          context: context,
          children: [
            TripOverview(
              myTrip: myTrip,
              setDate: setDate,
              cityName: widget.city.name,
              amount: amount,
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
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: saveTrip,
        child: Icon(Icons.forward),
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
          setState(
            () {
              changeIndex(newIndex);
            },
          );
        },
        currentIndex: index,
      ),
    );
  }
}
