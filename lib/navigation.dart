import 'package:flutter/material.dart';
import 'package:zomato/app/repositories/data_repository.dart';
import 'package:zomato/app/services/api.dart';
import 'package:zomato/app/services/api_service.dart';
import 'package:zomato/app/services/http_param.dart';
import 'package:zomato/model/nearby_restaurants.dart';
import 'package:location/location.dart';

class Nagigation extends StatefulWidget {
  @override
  _NagigationState createState() => _NagigationState();
}

class _NagigationState extends State<Nagigation> {
  Future<void> getNearby(double lat, double lon) async {
    var param = HttpParam.body();
    param.add("lat", lat);
    param.add("lon", lon);
    final List<NearbyRestaurants> dataRepo =
        await DataRepository(APIService(API.sandbox()))
            .nearbyRestaurantAPI(param);
  }

  @override
  void initState() {
    super.initState();
    Location().getLocation().then(
      (locationData) {
        getNearby(locationData.latitude, locationData.longitude);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Zomato'),
      ),
      body: Container(),
    );
  }
}
