import 'package:flutter/material.dart';
import 'package:widgets_tests/models/city_model.dart';

class TripCityBar extends StatelessWidget {
  final City city;

  TripCityBar({required this.city});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          Image.asset(
            city.image,
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black38,
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 35,
                        ))
                  ],
                ),
                Expanded(
                    child: Center(
                  child: Text(city.name,
                      style: TextStyle(fontSize: 35, color: Colors.white)),
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
