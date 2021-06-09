import 'package:flutter/material.dart';
import 'package:widgets_tests/models/Activity.type.dart';

class ActivityCard extends StatelessWidget {
  final Activity activity;

  ActivityCard({required this.activity});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 25),
      height: 250,
      width: double.infinity,
      child: Image.asset(activity.image, fit: BoxFit.cover,),
    );
  }
}
