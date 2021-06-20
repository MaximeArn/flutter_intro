import 'package:widgets_tests/models/city_model.dart';
import 'package:widgets_tests/views/home_view/widgets/city_card.dart';
import 'package:flutter/material.dart';
import 'package:widgets_tests/widgets/ask_modal.dart';

class Home extends StatefulWidget {
  static String routeName = "/";
  @override
  _HomeState createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
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

  void openModal(BuildContext context) {
    askModal(context, "hello").then((res) {
      print(res);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.home),
          title: Text("Travel"),
          actions: <Widget>[Icon(Icons.more_vert)],
        ),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                openModal(context);
              },
              child: Text("open modal"),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                child: ListView.builder(
                  itemCount: cities.length,
                  itemBuilder: (context, index) =>
                      CityCard(city: cities[index]),
                ),
              ),
            ),
          ],
        ));
  }
}
