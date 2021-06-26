import 'dart:collection';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:widgets_tests/models/city_model.dart';

class CityProvider with ChangeNotifier {
  List<City> _cities = [];

  UnmodifiableListView<City> get cities => UnmodifiableListView(_cities);

  City getCityByName(String cityName) =>
      cities.firstWhere((city) => city.name == cityName);

  void fetchCities() async {
    try {
      http.Response response =
          await http.get(Uri.parse('http://localhost:80/api/cities'));
      if (response.statusCode == 200) {
        _cities = (json.decode(response.body) as List)
            .map((cityJson) => City.fromJson(cityJson))
            .toList();
        print(_cities[0].name);
        notifyListeners();
      }
    } catch (e) {
      rethrow;
    }
  }
}
