import 'package:flutter/material.dart';
import '../../providers/city_provider.dart';
import '../../widgets/dyma_loader.dart';
import 'package:provider/provider.dart';
import './widgets/city_card.dart';
import '../../widgets/main_drawer.dart';
import '../../models/city_model.dart';

class HomeView extends StatefulWidget {
  static const String routeName = '/';

  @override
  _HomeState createState() {
    return _HomeState();
  }
}

class _HomeState extends State<HomeView> {
  TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<City> cities = Provider.of<CityProvider>(context).cities;
    return Scaffold(
      appBar: AppBar(
        title: const Text('dymatrip'),
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: "Rechercher une ville",
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.clear)),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: cities.length > 0
                  ? RefreshIndicator(
                      onRefresh: Provider.of<CityProvider>(context).fetchData,
                      child: ListView.builder(
                        itemCount: cities.length,
                        itemBuilder: (_, index) => CityCard(
                          city: cities[index],
                        ),
                      ),
                    )
                  : DymaLoader(),
            ),
          ),
        ],
      ),
    );
  }
}
