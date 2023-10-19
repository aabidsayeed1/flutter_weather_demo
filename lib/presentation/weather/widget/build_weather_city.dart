import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:weather_test/presentation/widgets/app_text.dart';

import '../../widgets/add_space.dart';
import '../weather_controller.dart';

class BuildWeatherCityWidget extends GetWidget<WeatherController> {
  const BuildWeatherCityWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var data = controller.weatherData;

    return Column(
      children: [
        AddSpace.vertical(70.h),
        AppText(
          text: controller.weatherData!.timezone!.toString(), // 'Kashmir',
          fontSize: 40.sp,
          textAlign: TextAlign.center,
          fontWeight: FontWeight.w600,
          lineHeight: 1.7,
        ),
        AppText(
          text: "${data?.elevation!.toString()}°", //'28°',
          fontSize: 140.sp,
          fontWeight: FontWeight.w400,
          textAlign: TextAlign.center,
          lineHeight: 1.4,
        ),
        AppText(
          text: 'Mostly Sunny', // 'Mostly Sunny',
          fontSize: 30.sp,
          fontWeight: FontWeight.w400,
          textAlign: TextAlign.center,

          lineHeight: 0.1,
        ),
        AppText(
          text:
              'H : ${data?.daily?.temperature2mMax?[0].toString()}°  L : ${data?.daily?.temperature2mMin?[0].toString()}°',
          fontSize: 22.sp,
          fontWeight: FontWeight.w400,
          textAlign: TextAlign.center,
          lineHeight: 2.2,
        ),
        AddSpace.vertical(20.h),
      ],
    );
  }

  String celsiusTemp(String f) {
    return (((double.parse(f) - 32) * 5) / 9).toString().split('.').first;
  }
}
