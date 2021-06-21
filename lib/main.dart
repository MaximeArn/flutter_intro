import 'package:flutter/material.dart';
import 'package:widgets_tests/views/404_view/not_found.dart';
import 'package:widgets_tests/views/city_view/city_view.dart';
import 'package:widgets_tests/views/trips_view/trips_view.dart';
import 'models/city_model.dart';
import 'models/trip_model.dart';
import 'views/home_view/home.dart';
import "./data/data.dart" as data;

void main() {
  runApp(TravelApp());
}

class TravelApp extends StatefulWidget {
  final List<City> cities = data.cities;

  @override
  _TravelAppState createState() => _TravelAppState();
}

class _TravelAppState extends State<TravelApp> {
  late List<Trip> trips;

  @override
  void initState() {
    trips = [];
    super.initState();
  }

  void addTrip(Trip trip) {
    trips.add(trip);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (BuildContext context) => HomeView(
              cities: widget.cities,
            ),
      },
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case CityView.routeName:
            return MaterialPageRoute(builder: (BuildContext context) {
              City city = settings.arguments as City;
              return CityView(city: city, addTrip: addTrip);
            });
          case TripsView.routeName:
            return MaterialPageRoute(builder: (BuildContext context) {
              return TripsView();
            });
          default:
        }
      },
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          builder: (BuildContext context) => NotFound(),
        );
      },
    );
  }
}
