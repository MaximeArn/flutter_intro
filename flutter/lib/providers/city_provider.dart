import 'package:flutter/foundation.dart';
import 'dart:collection';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:widgets_tests/environment/env.dart';
import 'package:widgets_tests/models/activity_model.dart';
import '../models/city_model.dart';

class CityProvider with ChangeNotifier {
  List<City> _cities = [];
  bool isLoading = false;

  UnmodifiableListView<City> get cities => UnmodifiableListView(_cities);

  City getCityByName(String cityName) =>
      cities.firstWhere((city) => city.name == cityName);

  UnmodifiableListView<City> getFilteredCities(String filter) =>
      UnmodifiableListView(
        _cities
            .where(
              (city) => city.name.toLowerCase().startsWith(
                    filter.toLowerCase(),
                  ),
            )
            .toList(),
      );

  Future<void> fetchData() async {
    try {
      isLoading = true;
      http.Response response =
          await http.get(Uri.parse('$serverUrl/api/cities'));
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

  Future<void> addActivity(Activity newActivity) async {
    try {
      String cityId = getCityByName(newActivity.city).id!;
      http.Response response = await http.post(
        Uri.parse('$serverUrl/api/city/$cityId/activity'),
        headers: {'Content-type': 'application/json'},
        body: json.encode(
          newActivity.toJson(),
        ),
      );
      print(response.statusCode);
      print(response.request);
      print(response.body);
      if (response.statusCode == 200) {
        int index = cities.indexWhere((city) => city.id == cityId);
        _cities[index] = City.fromJson(
          json.decode(response.body),
        );
        notifyListeners();
      }
    } catch (e) {
      print("error !");
      rethrow;
    }
  }
}
