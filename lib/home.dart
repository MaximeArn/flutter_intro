import 'package:fisrt_app/city_card.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
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
              children: [
                CityCard(),
                CityCard(),
              ],
            )),
      );
  }
}