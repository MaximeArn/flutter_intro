import 'package:flutter/material.dart';
import 'package:widgets_tests/views/404_view/not_found.dart';
import 'package:widgets_tests/views/city_view/city_view.dart';
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
        "/": (BuildContext context) => Home(),
      },
      onGenerateRoute: (RouteSettings settings) {
        if (settings.name == CityView.routeName) {
          City city = settings.arguments as City;
          return MaterialPageRoute(
            builder: (BuildContext context) => CityView(city: city),
          );
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
