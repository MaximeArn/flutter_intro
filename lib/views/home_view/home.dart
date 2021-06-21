import 'package:widgets_tests/models/city_model.dart';
import 'package:widgets_tests/views/home_view/widgets/city_card.dart';
import 'package:flutter/material.dart';
import 'package:widgets_tests/widgets/drawer.dart';

class HomeView extends StatefulWidget {
  static const String routeName = "/";
  @override
  _HomeViewState createState() {
    return _HomeViewState();
  }
}

class _HomeViewState extends State<HomeView> {
  List<City> cities = [
    City(name: "Rio", image: "assets/images/cities/rio.jpeg"),
    City(
      image: "assets/images/cities/bangkok.jpeg",
      name: "Bangkok",
    ),
    City(
      image: "assets/images/cities/paris.jpeg",
      name: "Paris",
    ),
    City(image: "assets/images/cities/new_york.jpeg", name: " New-York"),
    City(name: "Malbourne", image: "assets/images/cities/melbourne.jpeg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Travel"),
        actions: <Widget>[Icon(Icons.more_vert)],
      ),
      drawer: MainDrawer(),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: cities.length,
          itemBuilder: (context, index) => CityCard(city: cities[index]),
        ),
      ),
    );
  }
}
