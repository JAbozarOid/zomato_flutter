import 'package:zomato/model/restaurant.dart';

class NearbyRestaurants {
  Restaurant restaurant;

  NearbyRestaurants.fromJson(Map<String, dynamic> json) {
    restaurant = Restaurant.fromJson(json['restaurant']);
  }

  int code;
  String status;
  String message;
  
  NearbyRestaurants.fromJsonError(Map<String, dynamic> jsonError) {
    code = jsonError['code'];
    status = jsonError['status'];
    message = jsonError['message'];
  }
}
