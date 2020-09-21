class Restaurant {
  String name;

  Restaurant.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }
}
