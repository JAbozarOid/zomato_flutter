import 'package:zomato/app/services/api.dart';
import 'package:zomato/app/services/api_service.dart';
import 'package:zomato/app/services/http_param.dart';
import 'package:zomato/model/nearby_restaurants.dart';
import 'package:zomato/model/restaurant.dart';

class DataRepository {
  final APIService apiService;

  DataRepository(this.apiService);

  Future<List<NearbyRestaurants>> nearbyRestaurantAPI(double lat,double lon) async {

    var param = HttpParam.body();
    param.add("lat", lat);
    param.add("lon", lon);

    return await apiService.getNearbyRestaurants(
        endpoint: Endpoint.geocode, param: param);
  }

  Future<Restaurant> restaurantsDetailsAPI(String resId) async {
    var param = HttpParam.body();
    param.add("res_id", resId);

    return await apiService.getRestaurantDetails(
        endpoint: Endpoint.restaurant, param: param);
  }
}

class NetworkError extends Error {

}
