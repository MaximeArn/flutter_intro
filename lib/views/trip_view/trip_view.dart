import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widgets_tests/models/city_model.dart';
import 'package:widgets_tests/models/trip_model.dart';
import 'package:widgets_tests/providers/city_provider.dart';
import 'package:widgets_tests/providers/trip_provider.dart';
import 'package:widgets_tests/views/trip_view/widgets/trip_activities.dart';
import 'package:widgets_tests/views/trip_view/widgets/trip_city_bar.dart';

class TripView extends StatelessWidget {
  static const String routeName = "/trip";
  @override
  Widget build(BuildContext context) {
    final String cityName =
        (ModalRoute.of(context)!.settings.arguments as Map)["city"];
    final String tripId =
        (ModalRoute.of(context)!.settings.arguments as Map)["tripId"];
    final City city =
        Provider.of<CityProvider>(context).getCityByName(cityName);
    final Trip trip = Provider.of<TripProvider>(context).getTripById(tripId);

    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            TripCityBar(city: city),
            TripActivities(activities: trip.activities),
          ],
        ),
      ),
    ));
  }
}
