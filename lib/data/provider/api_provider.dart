import 'package:dio/dio.dart';
import 'package:weather_test/data/models/weather_model.dart';

class ApiProvider {
  final dio = Dio();
  Future<WeatherModel> getWeather() async {
    String url =
        'https://api.open-meteo.com/v1/forecast?latitude=52.52&longitude=13.41&current=temperature_2m&daily=weathercode,temperature_2m_max,temperature_2m_min,sunrise,sunset&timezone=auto&past_days=3';

    final response = await dio.get(url);
    final data = WeatherModel.fromJson(response.data);
    return data;
  }
}
