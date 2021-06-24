enum ActivityStatus { comming, past }

class Activity {
  String name;
  String image;
  String id;
  String city;
  double price;
  ActivityStatus status;

  Activity({
    required this.name,
    required this.image,
    required this.id,
    required this.city,
    required this.price,
  }): status = ActivityStatus.comming;
}
