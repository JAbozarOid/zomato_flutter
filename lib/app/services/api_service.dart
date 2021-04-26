import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:zomato/app/services/api.dart';
import 'package:http/http.dart' as http;
import 'package:zomato/app/services/base_http_response.dart';

class APIService {
  final API api;

  APIService(this.api);

  Future<BaseHttpResponse> getAPI(
      {@required String apiVersion,
      @required String path,
      @required Map<String, String> queryParameters}) async {
    final fullURL =
        Uri.https(API.host, apiVersion + path, queryParameters ?? {});

    print("request for the api $fullURL");
    print("the api key is ${api.apiKey}");
    try {
      var response = await http.get(fullURL, headers: {
        'user-key': '${api.apiKey}'
      }).timeout(Duration(seconds: 15));
      print(
          "the response for the api $fullURL is ${json.decode(response.body)} with status code ${response.statusCode} and reason phrase is ${response.reasonPhrase}");

      return Future.value(BaseHttpResponse(
          json: json.decode(
            response.body,
          ),
          statusCode: response.statusCode));
    } catch (error, stack) {
      print("The error in request $fullURL is $error and $stack");
      return Future.error(error);
    }
  }
}
