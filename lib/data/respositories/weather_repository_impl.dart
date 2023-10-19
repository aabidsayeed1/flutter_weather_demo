import 'package:weather_test/data/models/weather_model.dart';
import 'package:weather_test/data/provider/network/apis/weather_api.dart';

import '../../domain/repositories/weather_repository.dart';

class WeatherRespositoryImpl extends WeatherRepository {
  @override
  Future<WeatherModel> weather(params) async {
    final response = await WeatherAPI.weather(params).request();
    print(response);
    return WeatherModel.fromJson(response);
  }
}
