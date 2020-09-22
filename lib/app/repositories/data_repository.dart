import 'package:zomato/app/services/api.dart';
import 'package:zomato/app/services/api_service.dart';
import 'package:zomato/app/services/http_param.dart';
import 'package:zomato/model/nearby_restaurants.dart';
import 'package:location/location.dart';

class DataRepository {
  final APIService apiService;

  DataRepository(this.apiService);

  Future<List<NearbyRestaurants>> nearbyRestaurantAPI() async {
    double lat;
    double lon;
    Location().getLocation().then(
      (locationData) {
        lat = locationData.latitude;
        lon = locationData.longitude;
      },
    );

    var param = HttpParam.body();
    param.add("lat", "1.3521");
    param.add("lon", "103.8198");
    return await apiService.getNearbyRestaurants(
        endpoint: Endpoint.geocode, param: param);
  }
}

class NetworkError extends Error {}
