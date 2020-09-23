import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:zomato/app/repositories/data_repository.dart';
import 'package:zomato/model/nearby_restaurants.dart';
import 'package:equatable/equatable.dart';
import 'package:zomato/model/restaurant.dart';

part 'restaurants_event.dart';
part 'restaurants_state.dart';

class RestaurantsBloc extends Bloc<RestaurantsEvent, RestaurantsState> {
  final DataRepository dataRepository;
  RestaurantsBloc(this.dataRepository) : super(RestaurantsInitial());

  @override
  Stream<RestaurantsState> mapEventToState(
    RestaurantsEvent event,
  ) async* {
    yield RestaurantsLoading();

    if (event is GetNearbyRestaurants) {
      try {
        final restaurants = await dataRepository.nearbyRestaurantAPI(event.lat,event.lon);
        yield RestaurantsLoaded(restaurants);
      } on NetworkError {
        yield RestauranstsError("Coudn't fetch restaurants");
      }
    } else if (event is GetRestaurantDetail) {
      try {
        final restaurantDetails =
            await dataRepository.restaurantsDetailsAPI(event.resID);
        yield RestaurantDetailLoaded(restaurantDetails);
      } on NetworkError {
        yield RestauranstsError("Coudn't fetch restaurants");
      }
      
    }
  }
}



