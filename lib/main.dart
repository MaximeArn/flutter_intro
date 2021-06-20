import 'package:flutter/material.dart';
import 'package:widgets_tests/views/404/not_found.dart';
import 'package:widgets_tests/views/city_detail/city_detail.dart';
import 'models/city_model.dart';
import 'views/home/home.dart';

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
        if (settings.name == "/city") {
          City city = settings.arguments as City;
          return MaterialPageRoute(
            builder: (BuildContext context) => CityDetail(city: city),
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
