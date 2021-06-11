import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:widgets_tests/models/trip.type.dart';

class TripOverview extends StatelessWidget {
  final VoidCallback setDate;
  final Trip myTrip;

  double get amount {
    return 0;
  }

  TripOverview({required this.myTrip, required this.setDate});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      height: 200,
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Text(
            "Paris",
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
                child: Text(DateFormat("d/M/y").format(myTrip.date),
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
