import 'package:flutter/material.dart';
import 'package:zomato/app/repositories/data_repository.dart';
import 'package:zomato/app/services/api.dart';
import 'package:zomato/app/services/api_service.dart';
import 'package:zomato/model/nearby_restaurants.dart';
import 'package:zomato/ui/home/home.dart';
import 'package:zomato/ui/menu/menu.dart';

class Nagigation extends StatefulWidget {
  @override
  _NagigationState createState() => _NagigationState();
}

class _NagigationState extends State<Nagigation> {
  Future<void> getNearby() async {
    final List<NearbyRestaurants> dataRepo =
        await DataRepository(APIService(API.sandbox())).nearbyRestaurantAPI();
  }

  @override
  void initState() {
    super.initState();
    getNearby();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Menu(),
          ),
          Expanded(
            flex: 4,
            child: HomeScreen(),
          ),
        ],
      ),
    );
  }
}
