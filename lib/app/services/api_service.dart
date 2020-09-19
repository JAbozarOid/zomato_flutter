import 'package:flutter/foundation.dart';
import 'package:zomato/app/services/api.dart';
import 'package:http/http.dart' as http;
import 'package:zomato/app/services/base_http_response.dart';

class APIService {
  final API api;

  APIService(this.api);

  Future<BaseHttpResponse> getEndpointData(
      {@required String apiKey,
      @required Endpoint endpoint,
      @required Map<String, String> queryParameters}) async {
    final uri = api.endpointUri(endpoint, queryParameters);
    final response =
        await http.get(uri.toString(), headers: {'user-key': '$apiKey'});
  }
}
