import 'package:widgets_tests/models/city_model.dart';
import 'package:widgets_tests/views/home_view/widgets/city_card.dart';
import 'package:flutter/material.dart';
import 'package:widgets_tests/widgets/drawer.dart';

class HomeView extends StatefulWidget {
  final List<City> cities;
  static const String routeName = "/";

  HomeView({required this.cities});

  @override
  _HomeViewState createState() {
    return _HomeViewState();
  }
}

class _HomeViewState extends State<HomeView> {
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
          itemCount: widget.cities.length,
          itemBuilder: (context, index) => CityCard(city: widget.cities[index]),
        ),
      ),
    );
  }
}
