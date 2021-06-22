import 'package:widgets_tests/models/activity_model.dart';

class Trip {
  String city;
  List<Activity> activities;
  DateTime date;

  Trip({required this.activities, required this.city, required this.date});
}
