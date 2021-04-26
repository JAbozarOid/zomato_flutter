import 'package:flutter/foundation.dart';
import 'package:zomato/app/services/api_keys.dart';

enum APIVersions { version }

class API {
  final String apiKey;

  API({@required this.apiKey});

  factory API.sandbox() => API(apiKey: APIKeys.zomatoSandboxKey);

  static final String host = 'developers.zomato.com';

  static Map<APIVersions, String> apiVersion = {
    APIVersions.version: '/api/v2.1',
  };
}

enum Path { geocode, restaurant }

class PathApi {
  static String getApiPath(Path path) {
    switch (path) {
      case Path.geocode:
        return "/geocode";
      case Path.restaurant:
        return "/restaurant";
    }
    return "";
  }
}
