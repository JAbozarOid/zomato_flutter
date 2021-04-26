import 'dart:async';
import 'dart:io';

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
        final restaurants =
            await dataRepository.callNearbyRestaurantAPI(event.lat, event.lon);
        if (restaurants.getEndpointsData.statusCode == 200) {
          var res = restaurants.getEndpointsData.json['nearby_restaurants'];
          List<NearbyRestaurants> list =
              (res as List).map((e) => NearbyRestaurants.fromJson(e)).toList();
          yield RestaurantsLoaded(list);
        } else {
          var errorMessage = NearbyRestaurants.fromJsonError(
              restaurants.getEndpointsData.json);
          yield RestauranstsError(errorMessage.message);
        }
      } on SocketException catch (_) {
        yield RestauranstsError("Connection Error");
      } on TimeoutException catch (_) {
        yield RestauranstsError("Timeout Error, Please Try later");
      } catch (_) {
        yield RestauranstsError("Unknown Error");
      }
    } else if (event is GetRestaurantDetail) {
      try {
        final restaurantDetails =
            await dataRepository.callRestaurantDetailsAPI(event.resID);
        if (restaurantDetails.getEndpointsData.statusCode == 200) {
          var res =
              Restaurant.fromJson(restaurantDetails.getEndpointsData.json);
          yield RestaurantDetailLoaded(res);
        } else {
          var errorMessage =
              Restaurant.fromJsonError(restaurantDetails.getEndpointsData.json);
          yield RestauranstsError(errorMessage.message);
        }
      } on SocketException catch (_) {
        yield RestauranstsError("Connection Error");
      } on TimeoutException catch (_) {
        yield RestauranstsError("Timeout Error, Please Try later");
      } catch (_) {
        yield RestauranstsError("Unknown Error");
      }
    }
  }
}
