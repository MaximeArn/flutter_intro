import 'package:flutter/material.dart';
import 'package:widgets_tests/models/activity.type.dart';
import '../../data/data.dart' as data;

class Data extends InheritedWidget {
  final List<Activity> activities = data.activities;

  Data({required Widget child}) : super(child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}
