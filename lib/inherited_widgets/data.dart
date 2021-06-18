import 'package:flutter/material.dart';
import 'package:widgets_tests/models/activity_model.dart';
import '../../data/data.dart' as data;

class Data extends InheritedWidget {
  final List<Activity> activities = data.activities;

  Data({required Widget child}) : super(child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Data>();
  }
}
