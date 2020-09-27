import 'package:meta/meta.dart';

class FakeRestaurantModel {
  String imageUrl;
  double price;
  String name;
  String description;
  bool isLiked;

  FakeRestaurantModel({
    @required this.price,
    @required this.imageUrl,
    @required this.name,
    @required this.description,
    @required this.isLiked,
  });
}
