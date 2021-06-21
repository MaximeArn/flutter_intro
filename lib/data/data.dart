import 'package:widgets_tests/models/activity_model.dart';
import 'package:widgets_tests/models/city_model.dart';

List<City> cities = [
  City(name: "Rio", image: "assets/images/cities/rio.jpeg", activites: []),
  City(
      image: "assets/images/cities/bangkok.jpeg",
      name: "Bangkok",
      activites: []),
  City(image: "assets/images/cities/paris.jpeg", name: "Paris", activites: [
    Activity(
        image: 'assets/images/activities/louvre.jpeg',
        name: 'Le Louvre',
        id: 'a1',
        city: 'Paris',
        price: 10),
    Activity(
        image: 'assets/images/activities/butes_chaumont.jpeg',
        name: 'Les buttes Chaumont',
        id: 'a2',
        city: 'Paris',
        price: 15),
    Activity(
        image: 'assets/images/activities/notre_dame.jpg',
        name: 'Notre Dame',
        id: 'a3',
        city: 'Paris',
        price: 19.99),
    Activity(
        image: 'assets/images/activities/defense.jpeg',
        name: 'La Défense',
        id: 'a4',
        city: 'Paris',
        price: 25),
  ]),
  City(
      image: "assets/images/cities/new_york.jpeg",
      name: " New-York",
      activites: []),
  City(
      name: "Malbourne",
      image: "assets/images/cities/melbourne.jpeg",
      activites: []),
];
