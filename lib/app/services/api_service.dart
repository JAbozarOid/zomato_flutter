import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:zomato/app/services/api.dart';
import 'package:http/http.dart' as http;
import 'package:zomato/app/services/http_result.dart';
import 'package:zomato/model/nearby_restaurants.dart';

class APIService {
  final API api;

  APIService(this.api);

  Future<List<NearbyRestaurants>> getNearbyRestaurants(
      {@required String apiKey,
      @required Endpoint endpoint,
      @required HttpParam param}) async {
    final uri = api.endpointUri(endpoint);
    var query = param == null ? "" : param.toQuery();
    var fullURL = uri.toString() + query;

    print("request for the api $fullURL");
    try {
      var response = await http.get(fullURL, headers: {'user-key': '$apiKey'});
      print("the response for the api $fullURL  is ${response.body}");
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return (data['NearbyRestaurants'] as List).map((e) {
          return NearbyRestaurants.fromJson(e);
        }).toList();
      } else {
        return null;
      }
    } catch (e) {
      return e;
    }
  }
}
