import 'package:weather_test/data/models/weather_model.dart';
import 'package:weather_test/domain/repositories/weather_repository.dart';

import '../../app/core/usecases/param_usecase.dart';

class WeatherUseCase extends ParamUseCase<WeatherModel, dynamic> {
  final WeatherRepository _repo;
  WeatherUseCase(this._repo);
  @override
  Future<WeatherModel> execute(params) {
    return _repo.weather(params);
  }
}
