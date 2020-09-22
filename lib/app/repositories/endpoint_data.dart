import 'package:zomato/app/services/api.dart';
import 'package:zomato/model/nearby_restaurants.dart';

class EndpointData {
  final Map<Endpoint, List<NearbyRestaurants>> values;

  EndpointData(this.values);

  List<NearbyRestaurants> get nearbyRestaurants => values[Endpoint.geocode];

  @override
  String toString() => 'nearby: $nearbyRestaurants';
}
