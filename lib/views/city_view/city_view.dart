import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:widgets_tests/models/activity_model.dart';
import 'package:widgets_tests/models/city_model.dart';
import 'package:widgets_tests/models/trip_model.dart';
import 'package:widgets_tests/views/city_view/widgets/activities_list.dart';
import 'package:widgets_tests/views/city_view/widgets/booked_activities.dart';
import 'package:widgets_tests/views/city_view/widgets/trip_overview.dart';
import 'package:widgets_tests/views/home_view/home.dart';
import 'package:widgets_tests/widgets/confirmation_modal.dart';
import 'package:widgets_tests/widgets/drawer.dart';

class CityView extends StatefulWidget {
  static const String routeName = "/city";
  final City city;
  final Function addTrip;

  CityView({required this.city, required this.addTrip});

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
    activities = widget.city.activites;
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
      Activity activity = widget.city.activites
          .firstWhere((Activity activity) => activity.id == element);
      return previousValue + activity.price;
    });
  }

  Future<void> saveTrip() async {
    bool confirmed = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return ConfirmationModal(
            snackBarMessage: "Trip well saved !",
          );
        });
    if (confirmed) {
      widget.addTrip(myTrip);
      Navigator.pushNamed(context, HomeView.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Organize your trip"),
        actions: <Widget>[
          Icon(Icons.more_vert),
        ],
      ),
      drawer: const MainDrawer(),
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
        child: const Icon(Icons.forward),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.map), label: "discovery"),
          const BottomNavigationBarItem(
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
