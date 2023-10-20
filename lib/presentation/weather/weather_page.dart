import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_state_handler/page_state_handler.dart';
import 'package:weather_test/app/config/app_colors.dart';
import 'package:weather_test/presentation/weather/weather_controller.dart';
import 'package:adv_flutter_weather/flutter_weather_bg.dart';

import 'widget/build_daily.dart';
import 'widget/build_hourly.dart';
import 'widget/build_weather_city.dart';

class WeatherPage extends GetView<WeatherController> {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageStateHandler(
            isRefreshOnTop: false,
            controller: controller.pageStateController,
            retry: () => Future(
                  () => controller.getWeatherData(),
                ),
            loading: Stack(
              children: [
                Positioned.fill(
                  child: WeatherBg(
                    weatherType: controller.weatherType.value,
                    width: Get.width,
                    height: Get.height,
                  ),
                ),
                const Center(
                    child: CircularProgressIndicator(
                  color: Colors.white,
                )),
              ],
            ),
            child: Stack(
              children: [
                Positioned.fill(
                  child: WeatherBg(
                    weatherType: controller.weatherType.value,
                    width: Get.width,
                    height: Get.height,
                  ),
                ),
                Positioned.fill(
                    child: Container(
                  color: AppColors.black.withOpacity(0.3),
                )),
                SizedBox(
                  height: Get.height,
                  child: const SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BuildWeatherCityWidget(),
                        BuildHourlyWidget(),
                        BuildDailyWidget(),
                      ],
                    ),
                  ),
                ),
              ],
            )));
  }
}
