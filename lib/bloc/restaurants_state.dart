part of 'restaurants_bloc.dart';

abstract class RestaurantsState extends Equatable {
  const RestaurantsState();
}

class RestaurantsInitial extends RestaurantsState {
  const RestaurantsInitial();
  @override
  List<Object> get props => [];
}

class RestaurantsLoading extends RestaurantsState {
  const RestaurantsLoading();
  @override
  List<Object> get props => [];
}

class RestaurantsLoaded extends RestaurantsState {
  final List<NearbyRestaurants> restaurants;
  const RestaurantsLoaded(this.restaurants);
  @override
  List<Object> get props => [restaurants];
}

class RestaurantDetailLoaded extends RestaurantsState {
  final Restaurant restaurantsDetails;
  const RestaurantDetailLoaded(this.restaurantsDetails);
  @override
  List<Object> get props => [restaurantsDetails];
}

class RestauranstsError extends RestaurantsState {
  final String message;
  const RestauranstsError(this.message);
  @override
  List<Object> get props => [message];
}
