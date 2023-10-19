import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../app/config/app_colors.dart';
import '../../../app/util/app_assets.dart';
import '../../widgets/add_space.dart';
import '../../widgets/app_text.dart';
import '../weather_controller.dart';

class BuildHourlyWidget extends GetWidget<WeatherController> {
  const BuildHourlyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // var data = controller.weatherData!.weatherData!.hourly;
    // var dailyData = controller.weatherData!.weatherData!.daily!.headline;
    return Container(
      margin: EdgeInsets.all(20.r),
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
          color: AppColors.lightGray.withOpacity(0.4),
          borderRadius: BorderRadius.circular(20.r)),
      child: Column(
        children: [
          AppText(
            text:
                " 'Sunny consditions will continue all day. Wind\n gusts are up to 7 mps',",

            //  dailyData!.text
            //     .toString(), //,   'Sunny consditions will continue all day. Wind\n gusts are up to 7 mps',
            fontSize: 18.sp,
            fontWeight: FontWeight.w400,
            lineHeight: 1.6,
          ),
          Divider(
            color: AppColors.lightGray,
          ),
          AddSpace.vertical(10.h),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                  20, //   data!.length,
                  (index) => Container(
                        margin: EdgeInsets.only(right: 15.w),
                        child: Column(
                          children: [
                            AppText(
                              text: 'Now',

                              // index == 0
                              //     ? 'Now'
                              //     : timeFarmater(data[index].dateTime!),
                              fontSize: 26.sp,
                              fontWeight: FontWeight.w400,
                              lineHeight: 1.6,
                            ),
                            // Image.asset(
                            //   WeatherAssets.getIcon(data[index].weatherIcon!),
                            //   height: 60.h,
                            // ),
                            AppText(
                              text: '66°',
                              // '${celsiusTemp(data[index].temperature!.value.toString())}°', //'66°',
                              fontSize: 30.sp,
                              fontWeight: FontWeight.w400,
                              lineHeight: 1.6,
                            ),
                          ],
                        ),
                      )),
            ),
          )
        ],
      ),
    );
  }

  String timeFarmater(String time) {
    DateFormat dateFormat = DateFormat("hh a");
    DateTime dateTime = DateTime.parse(time).toLocal();
    return dateFormat.format(dateTime);
  }

  String celsiusTemp(String f) {
    return (((double.parse(f) - 32) * 5) / 9).toString().split('.').first;
  }
}
