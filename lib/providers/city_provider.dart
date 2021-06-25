import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:widgets_tests/models/city_model.dart';
import '../data/data.dart' as data;

class CityProvider with ChangeNotifier {
  final List<City> _cities = data.cities;

  UnmodifiableListView<City> get cities => UnmodifiableListView(_cities);
}
