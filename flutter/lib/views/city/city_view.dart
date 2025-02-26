import 'package:flutter/material.dart';
import 'package:widgets_tests/widgets/confirmation_modal.dart';
import '../../providers/city_provider.dart';
import '../../providers/trip_provider.dart';
import 'package:provider/provider.dart';

import './widgets/trip_activity_list.dart';
import './widgets/activity_list.dart';
import './widgets/trip_overview.dart';
import '../../views/home/home_view.dart';
import '../../widgets/main_drawer.dart';

import '../../models/city_model.dart';
import '../../models/activity_model.dart';
import '../../models/trip_model.dart';

class CityView extends StatefulWidget {
  static const String routeName = '/city';
  @override
  _CityState createState() => _CityState();
}

class _CityState extends State<CityView> {
  late Trip mytrip;
  late int index;

  @override
  void initState() {
    super.initState();
    index = 0;
    mytrip = Trip(
      activities: [],
      date: null,
      city: '',
    );
  }

  double get amount {
    return mytrip.activities.fold(0.0, (prev, element) {
      return prev + element.price;
    });
  }

  void setDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now().add(Duration(days: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime(2022),
    ).then((newDate) {
      if (newDate != null) {
        setState(() {
          mytrip.date = newDate;
        });
      }
    });
  }

  void switchIndex(newIndex) {
    setState(() {
      index = newIndex;
    });
  }

  void toggleActivity(Activity activity) {
    setState(() {
      mytrip.activities.contains(activity)
          ? mytrip.activities.remove(activity)
          : mytrip.activities.add(activity);
    });
  }

  void deleteTripActivity(Activity activity) {
    setState(() {
      mytrip.activities.remove(activity);
    });
  }

  void saveTrip(String cityName) async {
    final result = await showDialog(
        context: context, builder: (context) => ConfirmationModal());
    if (mytrip.date == null) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Attention !'),
            content: Text('Vous n\'avez pas entré de date'),
            actions: <Widget>[
              TextButton(
                child: Text('ok'),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        },
      );
    } else if (result == 'save') {
      mytrip.city = cityName;
      Provider.of<TripProvider>(context, listen: false).addTrip(mytrip);
      Navigator.pushNamed(context, HomeView.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    String cityName = ModalRoute.of(context)!.settings.arguments as String;
    City city = Provider.of<CityProvider>(context).getCityByName(cityName);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Organisation voyage'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/addTrip', arguments: cityName);
              },
              icon: Icon(Icons.add)),
        ],
      ),
      drawer: const MainDrawer(),
      body: Container(
        child: Column(
          children: <Widget>[
            TripOverview(
                cityName: city.name,
                trip: mytrip,
                setDate: setDate,
                amount: amount),
            Expanded(
              child: index == 0
                  ? ActivityList(
                      activities: city.activities,
                      selectedActivities: mytrip.activities,
                      toggleActivity: toggleActivity,
                    )
                  : TripActivityList(
                      activities: mytrip.activities,
                      deleteTripActivity: deleteTripActivity,
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.forward),
        onPressed: () {
          saveTrip(city.name);
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        items: [
          const BottomNavigationBarItem(
            icon: const Icon(Icons.map),
            label: 'Découverte',
          ),
          const BottomNavigationBarItem(
            icon: const Icon(Icons.stars),
            label: 'Mes activités',
          )
        ],
        onTap: switchIndex,
      ),
    );
  }
}
