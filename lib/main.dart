import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widgets_tests/models/activity_model.dart';
import 'package:widgets_tests/providers/city_provider.dart';
import 'package:widgets_tests/providers/trip_provider.dart';
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
  @override
  _TravelAppState createState() => _TravelAppState();
}

class _TravelAppState extends State<TravelApp> {
  late List<Trip> trips;

  // void addTrip(Trip trip) {
  //   trips.add(trip);
  // }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: CityProvider(),),
        ChangeNotifierProvider.value(value: TripProvider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          "/": (BuildContext context) => HomeView(),
          CityView.routeName: (BuildContext context) => CityView()
        },
        // onGenerateRoute: (RouteSettings settings) {
        //   switch (settings.name) {
        //     case CityView.routeName:
        //       return MaterialPageRoute(builder: (BuildContext context) {
        //         City city = settings.arguments as City;
        //         return CityView(city: city, addTrip: addTrip);
        //       });

        //     case TripsView.routeName:
        //       return MaterialPageRoute(builder: (BuildContext context) {
        //         return TripsView(trips: trips);
        //       });

        //     case TripView.routeName:
        //       return MaterialPageRoute(
        //         builder: (BuildContext context) {
        //           String tripId = (settings.arguments as Map)["tripId"];
        //           String cityName = (settings.arguments as Map)["city"];
        //           return TripView(
        //             trip: trips.firstWhere((Trip trip) => trip.id == tripId),
        //             city: widget.cities
        //                 .firstWhere((City city) => city.name == cityName),
        //           );
        //         },
        //       );

        //     default:
        //   }
        // },
        onUnknownRoute: (RouteSettings settings) {
          return MaterialPageRoute(
            builder: (BuildContext context) => const NotFound(),
          );
        },
      ),
    );
  }
}
