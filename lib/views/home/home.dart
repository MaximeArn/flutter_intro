import 'package:widgets_tests/views/home/widgets/city_card.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  List cities = [
    {"image": "assets/images/cities/rio.jpeg", "name": "Rio", "checked": false},
    {
      "image": "assets/images/cities/bangkok.jpeg",
      "name": "Bangkok",
      "checked": false
    },
    {
      "image": "assets/images/cities/paris.jpeg",
      "name": "Paris",
      "checked": false
    },
    {
      "image": "assets/images/cities/new_york.jpeg",
      "name": "New-York",
      "checked": false
    },
    {
      "image": "assets/images/cities/melbourne.jpeg",
      "name": "Melbourne",
      "checked": false
    }
  ];

  void toggleChecked(city) {
    int index = cities.indexOf(city);
    setState(() {
      cities[index]["checked"] = !cities[index]["checked"];
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
      body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <CityCard>[
              ...cities.map((city) => CityCard(
                    name: city["name"],
                    image: city["image"],
                    checked: city["checked"],
                    toggleChecked: () {
                      toggleChecked(city);
                    },
                  ))
            ],
          )),
    );
  }
}
