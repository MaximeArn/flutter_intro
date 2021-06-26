import 'dart:collection';
import 'package:flutter/foundation.dart';
import "dart:convert";
import 'package:http/http.dart' as http;
import 'package:widgets_tests/models/city_model.dart';

class CityProvider with ChangeNotifier {
  List<City> _cities = [];

  UnmodifiableListView<City> get cities => UnmodifiableListView(_cities);

  City getCityByName(String name) =>
      cities.firstWhere((city) => city.name == name);

  fetchCities() async {
    try {
      http.Response response =
          await http.get(Uri.parse("http://localhost:80/api/cities"));
      if (response.statusCode == 200) {
        print(json.decode(response.body));
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
