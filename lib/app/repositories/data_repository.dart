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
    var param = HttpParam.body();
    Location().getLocation().then(
      (locationData) {
        lat = locationData.latitude;
        lon = locationData.longitude;
        param.add("lat", lat);
        param.add("lon", lon);
      },
    );

    

    return await apiService.getNearbyRestaurants(
        endpoint: Endpoint.geocode, param: param);
  }
}

class NetworkError extends Error {}
