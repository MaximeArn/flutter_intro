import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:widgets_tests/models/activity_model.dart';
import 'package:widgets_tests/models/city_model.dart';
import 'package:widgets_tests/models/trip_model.dart';
import 'package:widgets_tests/providers/city_provider.dart';
import 'package:widgets_tests/views/city_view/widgets/activities_list.dart';
import 'package:widgets_tests/views/city_view/widgets/booked_activities.dart';
import 'package:widgets_tests/views/city_view/widgets/trip_overview.dart';
import 'package:widgets_tests/views/home_view/home.dart';
import 'package:widgets_tests/widgets/confirmation_modal.dart';
import 'package:widgets_tests/widgets/drawer.dart';

class CityView extends StatefulWidget {
  static const String routeName = "/city";

  @override
  _CityViewState createState() => _CityViewState();
}

class _CityViewState extends State<CityView> {
  late Trip myTrip;
  late int index;

  @override
  void initState() {
    index = 0;
    myTrip = Trip(activities: [], city: "", date: DateTime.now());
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

  void toggleActivity(Activity activity) {
    setState(() {
      myTrip.activities.contains(activity)
          ? myTrip.activities.remove(activity)
          : myTrip.activities.add(activity);
    });
  }

  void unBookActivity(Activity activity) {
    setState(() {
      myTrip.activities.remove(activity);
    });
  }

  double get amount {
    return myTrip.activities
        .fold(0, (previousValue, element) => previousValue + element.price);
  }

  Future<void> saveTrip(String cityName) async {
    bool confirmed = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return ConfirmationModal(
            snackBarMessage: "Trip well saved !",
          );
        });
    if (confirmed) {
      myTrip.city = cityName;
      Navigator.pushNamed(context, HomeView.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    String cityName = ModalRoute.of(context)!.settings.arguments as String;
    City city = Provider.of<CityProvider>(context).getCityByName(cityName);

    return Scaffold(
      appBar: AppBar(
        title: Text("Organize your trip"),
        actions: <Widget>[
          Icon(Icons.more_vert),
        ],
      ),
      drawer: const MainDrawer(),
      body: Container(
        child: Column(
          children: [
            TripOverview(
              myTrip: myTrip,
              setDate: setDate,
              cityName: city.name,
              amount: amount,
            ),
            Expanded(
              child: index == 0
                  ? ActivitiesList(
                      activities: city.activites,
                      toggleActivity: toggleActivity,
                      selectedActivities: myTrip.activities,
                    )
                  : BookedActivities(
                      bookedActivities: myTrip.activities,
                      unBookActivity: unBookActivity,
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          saveTrip(city.name);
        },
        child: const Icon(Icons.forward),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          const BottomNavigationBarItem(
              icon: Icon(Icons.map), label: "discovery"),
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
