import 'package:flutter/foundation.dart';
import 'package:zomato/app/services/api.dart';
import 'package:zomato/app/services/base_http_response.dart';

class EndpointsData {
  final Map<APIVersions, BaseHttpResponse> values;

  EndpointsData({@required this.values});

  BaseHttpResponse get getEndpointsData => values[APIVersions.version];

  @override
  String toString() => 'nearbyRestaurant: $getEndpointsData';

}

