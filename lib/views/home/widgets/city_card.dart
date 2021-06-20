import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:widgets_tests/models/city_model.dart';

class CityCard extends StatelessWidget {
  final City city;

  CityCard({required this.city});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 30),
      elevation: 10,
      child: Container(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Ink.image(
              fit: BoxFit.cover,
              image: AssetImage(
                city.image,
              ),
              child: InkWell(onTap: () {
                Navigator.pushNamed(context, "/unknownRoute");
              }),
            ),
            Positioned(
              top: 10,
              left: 10,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                color: Colors.black54,
                child: Text(
                  city.name,
                  style: TextStyle(color: Colors.white, fontSize: 35),
                ),
              ),
            ),
          ],
        ),
        height: 200,
      ),
    );
  }
}
