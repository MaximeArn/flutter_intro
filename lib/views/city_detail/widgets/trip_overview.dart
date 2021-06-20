import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:widgets_tests/models/trip_model.dart';

class TripOverview extends StatelessWidget {
  final VoidCallback setDate;
  final Trip myTrip;
  final String cityName;

  double get amount {
    return 0;
  }

  TripOverview(
      {required this.myTrip, required this.setDate, required this.cityName});

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    Size size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      height: 200,
      width: orientation == Orientation.landscape ? size.width / 2 : size.width,
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Text(
            cityName,
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                    myTrip.date != null
                        ? DateFormat("d/M/y").format(myTrip.date)
                        : "Select a date ",
                    style: TextStyle(fontSize: 17)),
              ),
              ElevatedButton(
                child: Text("Select a date "),
                onPressed: setDate,
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  "price/person : ",
                  style: TextStyle(fontSize: 17),
                ),
              ),
              Text("$amount \$", style: TextStyle(fontSize: 17)),
            ],
          ),
        ],
      ),
    );
  }
}
