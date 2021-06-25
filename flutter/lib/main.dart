import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widgets_tests/providers/city_provider.dart';
import 'package:widgets_tests/providers/trip_provider.dart';
import 'package:widgets_tests/views/404_view/not_found.dart';
import 'package:widgets_tests/views/city_view/city_view.dart';
import 'package:widgets_tests/views/trip_view/trip_view.dart';
import 'package:widgets_tests/views/trips_view/trips_view.dart';
import 'views/home_view/home.dart';

void main() {
  runApp(TravelApp());
}

class TravelApp extends StatefulWidget {
  @override
  _TravelAppState createState() => _TravelAppState();
}

class _TravelAppState extends State<TravelApp> {
  final CityProvider cityProvider = CityProvider();

  @override
  void initState() {
    cityProvider.fetchCities();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: CityProvider(),
        ),
        ChangeNotifierProvider.value(
          value: TripProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          "/": (_) => HomeView(),
          CityView.routeName: (_) => CityView(),
          TripsView.routeName: (_) => TripsView(),
          TripView.routeName: (_) => TripView(),
        },
        onUnknownRoute: (_) => MaterialPageRoute(
          builder: (_) => const NotFound(),
        ),
      ),
    );
  }
}
