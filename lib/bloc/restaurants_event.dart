part of 'restaurants_bloc.dart';

abstract class RestaurantsEvent extends Equatable {
  const RestaurantsEvent();
}

class GetNearbyRestaurants extends RestaurantsEvent {
  final String name;
  final String cuisines;

  const GetNearbyRestaurants(this.name,this.cuisines);

  @override
  List<Object> get props => [name,cuisines];
}

class GetRestaurantDetail extends RestaurantsEvent {
  final String resID;

  const GetRestaurantDetail(this.resID);

  @override
  List<Object> get props => [resID];
}
