import 'package:provider/provider.dart';
import 'package:widgets_tests/models/city_model.dart';
import 'package:widgets_tests/providers/city_provider.dart';
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
  @override
  Widget build(BuildContext context) {
    List<City> cities = Provider.of<CityProvider>(context).cities;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Travel"),
        actions: <Widget>[const Icon(Icons.more_vert)],
      ),
      drawer: const MainDrawer(),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: cities.length,
          itemBuilder: (context, index) => CityCard(city: cities[index]),
        ),
      ),
    );
  }
}
