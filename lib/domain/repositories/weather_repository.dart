import 'package:weather_test/data/models/weather_model.dart';

abstract class WeatherRepository {
  Future<WeatherModel> weather(dynamic params);
}
