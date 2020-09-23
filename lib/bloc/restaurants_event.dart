part of 'restaurants_bloc.dart';

abstract class RestaurantsEvent extends Equatable {
  const RestaurantsEvent();
}

class GetNearbyRestaurants extends RestaurantsEvent {
  final double lat;
  final double lon;
  const GetNearbyRestaurants(this.lat,this.lon);

  @override
  List<Object> get props => [];
}

class GetRestaurantDetail extends RestaurantsEvent {
  final String resID;

  const GetRestaurantDetail(this.resID);

  @override
  List<Object> get props => [resID];
}
