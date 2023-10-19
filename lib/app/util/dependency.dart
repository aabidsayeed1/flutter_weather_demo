import 'package:get/get.dart';
import 'package:weather_test/data/respositories/weather_repository_impl.dart';

class DependencyCreator {
  static init() {
    Get.lazyPut(
      () => WeatherRespositoryImpl(),
    );
  }
}
