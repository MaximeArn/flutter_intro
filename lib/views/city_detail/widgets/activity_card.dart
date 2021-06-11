import 'package:flutter/material.dart';
import 'package:widgets_tests/models/activity.type.dart';

class ActivityCard extends StatelessWidget {
  final Activity activity;

  ActivityCard({required this.activity});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: double.infinity,
      child: Image.asset(
        activity.image,
        fit: BoxFit.cover,
      ),
    );
  }
}
