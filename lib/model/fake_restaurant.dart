import 'package:meta/meta.dart';

class RestaurantModel {
  String imageUrl;
  double price;
  String name;
  String description;
  bool isLiked;

  RestaurantModel({
    @required this.price,
    @required this.imageUrl,
    @required this.name,
    @required this.description,
    @required this.isLiked,
  });
}
