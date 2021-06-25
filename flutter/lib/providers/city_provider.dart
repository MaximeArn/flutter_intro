import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:widgets_tests/models/city_model.dart';

class CityProvider with ChangeNotifier {
  List<City> _cities = [];

  UnmodifiableListView<City> get cities => UnmodifiableListView(_cities);

  City getCityByName(String name) =>
      cities.firstWhere((city) => city.name == name);

  fetchCities() async {
    Uri url = Uri.http(
      "10.0.2.2:80",
      "/api/cities",
    );

    try {
      http.Response response = await http.get(url);
      print(response.statusCode);
      print(response.body);
      print(response.request);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
