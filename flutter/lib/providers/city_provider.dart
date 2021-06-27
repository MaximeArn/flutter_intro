import 'package:flutter/foundation.dart';
import 'package:flutter_chapitre13/environment/env.dart';
import 'dart:collection';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/city_model.dart';

class CityProvider with ChangeNotifier {
  List<City> _cities = [];
  bool isLoading = false;

  UnmodifiableListView<City> get cities => UnmodifiableListView(_cities);

  City getCityByName(String cityName) =>
      cities.firstWhere((city) => city.name == cityName);

  Future<void> fetchData() async {
    try {
      isLoading = true;
      http.Response response = await http.get(Uri.parse('$serverUrl/api/cities'));
      if (response.statusCode == 200) {
        _cities = (json.decode(response.body) as List)
            .map((cityJson) => City.fromJson(cityJson))
            .toList();
        isLoading = false;
        notifyListeners();
      }
    } catch (e) {
      isLoading = false;
      rethrow;
    }
  }
}
