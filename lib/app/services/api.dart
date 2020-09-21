import 'package:flutter/foundation.dart';
import 'package:zomato/app/services/api_keys.dart';

enum Endpoint { geocode, restaurant }

class API {
  final String apiKey;

  API({@required this.apiKey});

  factory API.sandbox() => API(apiKey: APIKeys.zomatoSandboxKey);

  static final String host = 'developers.zomato.com/api/v2.1';

  Uri endpointUri(Endpoint endpoint) => Uri(
        scheme: 'https',
        host: host,
        path: _path[endpoint],
      );

  static Map<Endpoint, String> _path = {
    Endpoint.geocode: 'geocode',
    Endpoint.restaurant: 'restaurant'
  };
}
