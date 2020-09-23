class Restaurant {
  String name;
  String cuisines;
  bool includeBogoOffers;
  int priceRange;
  String id;
  Restaurant.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    cuisines = json['cuisines'];
    includeBogoOffers = json['include_bogo_offers'];
    priceRange = json['price_range'];
    id = json['id'];
  }
}
