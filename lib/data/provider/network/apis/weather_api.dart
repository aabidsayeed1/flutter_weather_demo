import 'dart:io';
import 'package:weather_test/data/provider/network/api_endpoint.dart';
import 'package:weather_test/data/provider/network/api_provider.dart';
import '../api_request_representable.dart';

enum WeatherType { weather }

class WeatherAPI implements APIRequestRepresentable {
  final WeatherType type;
  dynamic jsonData;

  WeatherAPI._({
    required this.type,
    required this.jsonData,
  });

  WeatherAPI.weather(dynamic jsonData)
      : this._(type: WeatherType.weather, jsonData: jsonData);

  @override
  String get baseUrl => APIEndpoint.baseUrl;

  @override
  String get endPoint {
    switch (type) {
      case WeatherType.weather:
        return APIEndpoint.weatherApi;

      default:
        return "";
    }
  }

  @override
  HTTPMethod get method {
    return HTTPMethod.get;
  }

  @override
  Map<String, String> get headers => {
        HttpHeaders.contentTypeHeader: 'application/json',
        "Accept": "application/json"
      };

  @override
  Map<String, dynamic> get query {
    return jsonData;
  }

  @override
  get body => null;

  @override
  Future request() {
    return APIProvider.instance.request(this);
  }

  @override
  String get url => baseUrl + endPoint;
}
