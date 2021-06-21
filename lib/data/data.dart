import 'package:widgets_tests/models/activity_model.dart';
import 'package:widgets_tests/models/city_model.dart';

List<City> cities = [
  City(
    name: "Rio", image: "assets/images/cities/rio.jpeg", activites: [
    Activity(
        name: "Botanical Garden",
        image: "assets/images/activities/rio/botanical_garden.jpg",
        id: "rio_1",
        city: "Rio",
        price: 15),
    Activity(
        name: "Christ",
        image: "assets/images/activities/rio/christ.jpeg",
        id: "rio_2",
        city: "Rio",
        price: 25),
    Activity(
        name: "Copacabana",
        image: "assets/images/activities/rio/copacabana.jpg",
        id: "rio_3",
        city: "Rio",
        price: 0),
    Activity(
        name: "Ipanema Beach",
        image: "assets/images/activities/rio/ipanema_beach.jpg",
        id: "rio_4",
        city: "Rio",
        price: 0),
    Activity(
        name: "Maracana",
        image: "assets/images/activities/rio/maracana.jpg",
        id: "rio_5",
        city: "Rio",
        price: 30),
    Activity(
        name: "Museum",
        image: "assets/images/activities/rio/museum.jpg",
        id: "rio_6",
        city: "Rio",
        price: 10),
    Activity(
        name: "Pain de Sucre",
        image: "assets/images/activities/rio/pain_de_sucre.jpeg",
        id: "rio_7",
        city: "Rio",
        price: 22),
  ]),
  City(
    image: "assets/images/cities/bangkok.jpeg", name: "Bangkok", activites: [
    Activity(
        name: "China Town",
        image: "assets/images/activities/bangkok/china_town.jpg",
        id: "bangkok_1",
        city: "Bangkok",
        price: 0),
    Activity(
        name: "Grand Palais",
        image: "assets/images/activities/bangkok/grand_palais.jpg",
        id: "bangkok_2",
        city: "Bangkok",
        price: 25),
    Activity(
        name: "Wat Arun",
        image: "assets/images/activities/bangkok/wat_arun.jpg",
        id: "bangkok_3",
        city: "Bangkok",
        price: 12),
    Activity(
        name: "Wat Pho",
        image: "assets/images/activities/bangkok/wat_pho.jpg",
        id: "bangkok_4",
        city: "Bangkok",
        price: 30),
    Activity(
        name: "Wat Saket Mont Dor",
        image: "assets/images/activities/bangkok/wat_saket_mont_dor.jpg",
        id: "bangkok_5",
        city: "Bangkok",
        price: 23),
  ]),
  City(
    image: "assets/images/cities/paris.jpeg", name: "Paris", activites: [
    Activity(
        image: 'assets/images/activities/paris/louvre.jpeg',
        name: 'Le Louvre',
        id: 'paris_1',
        city: 'Paris',
        price: 10),
    Activity(
        image: 'assets/images/activities/paris/butes_chaumont.jpeg',
        name: 'Les buttes Chaumont',
        id: 'paris_2',
        city: 'Paris',
        price: 15),
    Activity(
        image: 'assets/images/activities/paris/notre_dame.jpg',
        name: 'Notre Dame',
        id: 'paris_3',
        city: 'Paris',
        price: 20),
    Activity(
        image: 'assets/images/activities/paris/defense.jpeg',
        name: 'La Défense',
        id: 'paris_4',
        city: 'Paris',
        price: 25),
  ]),
  City(
      image: "assets/images/cities/new_york.jpeg",
      name: " New-York",
      activites: [
        Activity(
            name: "Cathedrale Saint Patrick",
            image: "assets/images/activities/new-york/catedral_san_patricio.jpg",
            id: "new_york_1",
            city: "New-York",
            price: 20),
        Activity(
            name: "Central Park",
            image: "assets/images/activities/new-york/central_park.jpg",
            id: "new_york_2",
            city: "New-York",
            price: 0),
        Activity(
            name: "Chrysler Building",
            image: "assets/images/activities/new-york/chrysler_building.jpg",
            id: "new_york_3",
            city: "New-York",
            price: 35),
        Activity(
            name: "Empire State",
            image: "assets/images/activities/new-york/empire_state.jpg",
            id: "new_york_4",
            city: "New-York",
            price: 50),
        Activity(
            name: "Freedom Statue",
            image: "assets/images/activities/new-york/freedom_statue.jpg",
            id: "new_york_5",
            city: "New-York",
            price: 15),
        Activity(
            name: "Times Square",
            image: "assets/images/activities/new-york/times_square.jpg",
            id: "new_york_6",
            city: "New-York",
            price: 0)
      ]),
];
