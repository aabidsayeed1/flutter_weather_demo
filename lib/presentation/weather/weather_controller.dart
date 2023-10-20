import 'package:adv_flutter_weather/flutter_weather_bg.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:page_state_handler/page_state_handler.dart';
import 'package:weather_test/data/models/weather_model.dart';
import 'package:weather_test/domain/usecases/weather_usecase.dart';
import '../../domain/entities/weather_entity.dart';
import '../Base/base_controller.dart';

class WeatherController extends GetxController with BaseController {
  final WeatherUseCase _weatherUseCase;
  WeatherController(this._weatherUseCase);
  PageStateController pageStateController = PageStateController();
  Location location = Location();
  bool? _serviceEnabled;
  PermissionStatus? _permissionGranted;
  LocationData? _locationData;
  WeatherModel? weatherData;
  var weatherType = WeatherType.sunny.obs;

  @override
  void onInit() async {
    super.onInit();
    await getLocation();
    getWeatherData();
  }

  // get current location

  Future<void> getLocation() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled!) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled!) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    print(_locationData);
  }

  void getWeatherData() async {
    try {
      pageStateController.onStateUpdate(PageState.loading);

      await _weatherUseCase
          .execute(WeatherEntity(
                  lat: _locationData?.latitude.toString(),
                  lng: _locationData?.longitude.toString())
              .toMap())
          .then((value) {
        print("weatherData ${value.timezone}");
        weatherData = value;
        pageStateController.onStateUpdate(PageState.loaded);
      });
    } catch (e) {
      pageStateController.onError(handleError(e, () {}, isBack: false));
    }
  }

  getWeatherBg(String type) {
    switch (type) {
      case 'Sunny':
      case 'Mostly Sunny':
      case 'Partly Sunny':
      case 'Intermittent Clouds':
      case 'Hot':
        weatherType.value = WeatherType.sunny;
        break;
      case 'Rain':
        weatherType.value = WeatherType.heavyRainy;
        break;
      case 'Partly Sunny w/ Flurries':
      case 'Sleet':
      case 'Freezing Rain':
      case 'Rain and Snow':
      case 'Mostly Cloudy w/ Flurries':
        weatherType.value = WeatherType.middleSnow;
        break;
      case 'Partly Sunny w/ Showers':
      case 'Partly Sunny w/ T-Storms':
        weatherType.value = WeatherType.middleRainy;
        break;
      case 'Snow':
      case 'Ice':
      case 'Mostly Cloudy w/ Snow':
        weatherType.value = WeatherType.heavySnow;
        break;
      case 'T-Storms':
      case 'Mostly Cloudy w/ T-Storms':
      case 'Partly Cloudy w/ T-Storms':
        weatherType.value = WeatherType.storm;
        break;
      case 'Showers':
      case 'Mostly Cloudy w/ Showers':
      case 'Partly Cloudy w/ Showers':
        weatherType.value = WeatherType.lightRainy;
        break;
      case 'Flurries':
        weatherType.value = WeatherType.lightSnow;
        break;
      case 'sunnyNight':
      case 'Clear':
      case 'Mostly Clear':
        weatherType.value = WeatherType.sunnyNight;
        break;
      case 'Mostly Cloudy':
      case 'Cloudy':
      case 'Cold':
      case 'Windy':
        weatherType.value = WeatherType.cloudy;
        break;
      case 'Dreary (Overcast)':
      case 'Partly Cloudy':
      case 'Hazy Moonlight':
        weatherType.value = WeatherType.cloudyNight;
        break;
      case 'overcast':
        weatherType.value = WeatherType.overcast;
        break;
      case 'Hazy Sunshine':
        weatherType.value = WeatherType.hazy;
        break;
      case 'Fog':
        weatherType.value = WeatherType.foggy;
        break;
      case 'dusty':
        weatherType.value = WeatherType.dusty;
        break;
    }
  }
}
