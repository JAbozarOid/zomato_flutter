import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:zomato/app/services/api.dart';
import 'package:http/http.dart' as http;
import 'package:zomato/app/services/http_param.dart';
import 'package:zomato/model/nearby_restaurants.dart';

class APIService {
  final API api;

  APIService(this.api);

  Future<List<NearbyRestaurants>> getNearbyRestaurants(
      {@required Endpoint endpoint, @required HttpParam param}) async {
    final uri = api.endpointUri(endpoint);
    var query = param == null ? "" : param.toQuery();
    var fullURL = uri.toString() + query;

    print("request for the api $fullURL");
    print("the api key is ${api.apiKey}");
    try {
      var response =
          await http.get(fullURL, headers: {'user-key': '${api.apiKey}'});
      print(
          "the response for the api $fullURL  is ${json.decode(response.body)}");
      if (response.statusCode == 200) {
        print("<<<<the response code is ${response.statusCode}>>>>");
        final data = json.decode(response.body);
        return (data['nearby_restaurants'] as List).map((e) {
          return NearbyRestaurants.fromJson(e);
        }).toList();
      } else {
        print(
            'Request $fullURL failed\nResponse: ${response.statusCode} ${response.reasonPhrase}');
        return null;
      }
    } catch (e) {
      print("The error is ${e.toString()}");
      return e;
    }
  }
}
