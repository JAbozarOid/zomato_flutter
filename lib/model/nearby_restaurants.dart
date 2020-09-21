import 'package:zomato/model/restaurant.dart';

class NearbyRestaurants {
  Restaurant restaurant;

  NearbyRestaurants.fromJson(Map<String, dynamic> json) {
    restaurant = json['restaurant'];
  }
}
