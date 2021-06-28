import 'dart:ui';

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
  void initState() {
    searchController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("build");

    CityProvider cityProvider = Provider.of<CityProvider>(context);
    List<City> filteredCities =
        cityProvider.getFilteredCities(searchController.text);

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
                    decoration: const InputDecoration(
                      hintText: "Rechercher une ville",
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        searchController.clear();
                      });
                    },
                    icon: const Icon(Icons.clear)),
              ],
            ),
          ),
          Expanded(
            child: Container(
                padding: const EdgeInsets.all(10),
                child: RefreshIndicator(
                  onRefresh: Provider.of<CityProvider>(context).fetchData,
                  child: cityProvider.isLoading
                      ? DymaLoader()
                      : filteredCities.length > 0
                          ? ListView.builder(
                              itemCount: filteredCities.length,
                              itemBuilder: (_, index) => CityCard(
                                city: filteredCities[index],
                              ),
                            )
                          : Center(
                              child: Text(
                              "Aucun resultat",
                              style:
                                  TextStyle(fontSize: 25, color: Colors.grey),
                            )),
                )),
          ),
        ],
      ),
    );
  }
}
