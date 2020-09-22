import 'package:zomato/app/services/api.dart';
import 'package:zomato/app/services/api_service.dart';
import 'package:zomato/app/services/http_param.dart';
import 'package:zomato/model/nearby_restaurants.dart';

class DataRepository {
  final APIService apiService;

  DataRepository(this.apiService);

  Future<List<NearbyRestaurants>> nearbyRestaurantAPI(HttpParam param) async {
    return await apiService.getNearbyRestaurants(endpoint: Endpoint.geocode, param: param);
  }
}
