import 'package:flutter/material.dart';
import 'package:widgets_tests/views/404_view/not_found.dart';
import 'package:widgets_tests/views/city_view/city_view.dart';
import 'package:widgets_tests/views/trip_view/trip_view.dart';
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
    trips = [
      Trip(
        activities: [],
        city: "Prague",
        date: DateTime.now().add(
          Duration(days: 10),
        ),
      ),
      Trip(
        activities: [],
        city: "Amsterdam",
        date: DateTime.now().add(
          Duration(days: 20),
        ),
      ),
      Trip(
        activities: [],
        city: "Bruxelle",
        date: DateTime.now().add(
          Duration(days: 30),
        ),
      ),
      Trip(
        activities: [],
        city: "Paris",
        date: DateTime.now().subtract(
          Duration(days: 10),
        ),
      ),
      Trip(
        activities: [],
        city: "Barcelona",
        date: DateTime.now().subtract(
          Duration(days: 20),
        ),
      ),
    ];
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
              return TripsView(trips: trips);
            });

          case TripView.routeName:
            return MaterialPageRoute(
              builder: (BuildContext context) {
                String tripId = (settings.arguments as Map)["tripId"];
                String cityName = (settings.arguments as Map)["city"];
                return TripView(
                    trip: trips.firstWhere((Trip trip) => trip.id == tripId),
                    city: widget.cities
                        .firstWhere((City city) => city.name == cityName));
              },
            );
            
          default:
        }
      },
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          builder: (BuildContext context) => const NotFound(),
        );
      },
    );
  }
}
