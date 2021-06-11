import 'package:flutter/material.dart';
import 'package:widgets_tests/views/city_detail/city_detail.dart';

void main() {
  runApp(TravelApp());
}

class TravelApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: CityDetail());
  }
}
