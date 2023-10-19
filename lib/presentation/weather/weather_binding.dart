import 'package:get/get.dart';
import 'package:weather_test/data/respositories/weather_repository_impl.dart';
import 'package:weather_test/domain/usecases/weather_usecase.dart';
import 'package:weather_test/presentation/weather/weather_controller.dart';

class WeatherBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WeatherUseCase(Get.find<WeatherRespositoryImpl>()));
    Get.lazyPut(() => WeatherController(Get.find()));
  }
}
