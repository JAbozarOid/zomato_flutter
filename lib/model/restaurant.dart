class Restaurant {
  String name;
  String cuisines;
  Restaurant.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    cuisines = json['cuisines'];
  }
}
