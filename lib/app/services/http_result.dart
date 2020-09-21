import 'dart:convert';

import 'package:http/http.dart';

class HttpParam {
  HttpParamType type;

  Map<String, dynamic> _data = new Map();

  HttpParam.query() {
    this.type = HttpParamType.Query;
  }

  HttpParam.body() {
    this.type = HttpParamType.Query;
  }

  void add(String key, dynamic value) {
    this._data[key] = value.toString();
  }

  Map<String, dynamic> toData() {
    return _data;
  }

  String toQuery() {
    var url = "?";
    _data.forEach((k, v) {
      url += k + "=" + v + "&";
    });
    return url;
  }
}

enum HttpParamType { Body, Query }

typedef T GenericHttpCallback<T>(dynamic);
typedef void GenericCallback<T>(T);

class HttpResult<T> {

  T result;
  bool success;
  String error;

  static HttpResult<dynamic> fromError(String error) {
    var httpResult = new HttpResult<dynamic>();
    httpResult.success = false;
    httpResult.error = error;
    return httpResult;
  }

  static HttpResult<dynamic> fromResponse(Response response) {
    var httpResult = new HttpResult<dynamic>();
    var j = json.decode(response.body);
    print("the decoded json is $j");
    httpResult.result = j;
    httpResult.success = response.statusCode == 200;
    if (j["error"] != null) {
      var err = j["error"];
      try {
        httpResult.success = false;
        httpResult.error = j["error"];
      } catch (e) {
        httpResult.success = false;
        httpResult.error = "خطا در ارتباط با سرور";
      }
    }
    return httpResult;
  }

  HttpResult<NewType> map<NewType>(GenericHttpCallback<NewType> handler) {
    try {
      var httpResult = new HttpResult<NewType>();
      if (success) {
        httpResult.result = handler(result);
      }
      httpResult.error = error;
      httpResult.success = success;
      return httpResult;
    } catch (e) {
      print("failed to parse data ${e.toString()}");
      var httpResult = new HttpResult<NewType>();
      httpResult.error = "خطا در پارس کردن کردن داده";
      httpResult.success = false;
      return httpResult;
    }
  }
}