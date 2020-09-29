import 'package:flutter/cupertino.dart';
import 'package:zomato/app/repositories/endpoints_data.dart';
import 'package:zomato/app/services/api.dart';
import 'package:zomato/app/services/api_service.dart';
import 'package:http/http.dart';

class DataRepository {
  final APIService apiService;

  DataRepository(this.apiService);

  Future<T> _getData<T>({Future<T> Function() onGetData}) async {
    try {
      return await onGetData();
    } on Response catch (response) {
      // invalid coordinates
      if (response.statusCode == 400) {
        return await onGetData();
      }
      // invalid api key
      if (response.statusCode == 403) {
        return await onGetData();
      }
      // not found
      if (response.statusCode == 404) {
        return await onGetData();
      }
      rethrow;
    }
  }

  Future<EndpointsData> callNearbyRestaurantAPI(double lat, double lon) async =>
      await _getData<EndpointsData>(
          onGetData: () => _getNearbyRestaurantsData(lat, lon));

  Future<EndpointsData> _getNearbyRestaurantsData(
      double lat, double lon) async {
    final values = await Future.wait([
      apiService.getAPI(
          apiVersion: API.apiVersion[APIVersions.version],
          path: PathApi.getApiPath(Path.geocode),
          queryParameters: {
            "lat": lat.toString(),
            "lon": lon.toString().toString()
          }),
    ]);

    return EndpointsData(values: {
      APIVersions.version: values[0],
    });
  }

  Future<EndpointsData> callRestaurantDetailsAPI(String resId) async =>
      await _getData<EndpointsData>(
          onGetData: () => _getRestaurantDetailData(resId));

  Future<EndpointsData> _getRestaurantDetailData(String resId) async {
    final values = await Future.wait([
      apiService.getAPI(
          apiVersion: API.apiVersion[APIVersions.version],
          path: PathApi.getApiPath(Path.restaurant),
          queryParameters: {"res_id": resId})
    ]);

    return EndpointsData(values: {
      APIVersions.version: values[0],
    });
  }
}
