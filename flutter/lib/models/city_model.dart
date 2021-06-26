import 'package:widgets_tests/models/activity_model.dart';

class City {
  String id;
  String name;
  String image;
  List<Activity> activites;


  City(
      {required this.id,
      required this.name,
      required this.image,
      required this.activites});

   City.fromJson(Map<String, dynamic> json)
      : id = json['_id'],
        image = json['image'],
        name = json['name'],
        activites = (json['activities'] as List)
            .map((activityJson) => Activity.fromJson(activityJson))
            .toList();
}
