enum ActivityStatus { comming, past }

class Activity {
  String id;
  String name;
  String image;
  String city;
  double price;
  ActivityStatus status;

  Activity({
    required this.id,
    required this.name,
    required this.image,
    required this.city,
    required this.price,
  }) : status = ActivityStatus.comming;

  Activity.fromJson(Map<String, dynamic> json)
      : id = json['_id'],
        name = json['name'],
        image = json['image'],
        city = json['city'],
        price = json['price'].toDouble(),
        status =
            json['status'] == 0 ? ActivityStatus.comming : ActivityStatus.past;
}
