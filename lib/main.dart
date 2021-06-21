import 'package:flutter/material.dart';
import 'package:widgets_tests/views/404_view/not_found.dart';
import 'package:widgets_tests/views/city_view/city_view.dart';
import 'package:widgets_tests/views/trips_view/trips_view.dart';
import 'models/city_model.dart';
import 'views/home_view/home.dart';

void main() {
  runApp(TravelApp());
}

class TravelApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (BuildContext context) => HomeView(),
      },
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case CityView.routeName:
            return MaterialPageRoute(builder: (BuildContext context) {
              City city = settings.arguments as City;
              return CityView(city: city);
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
