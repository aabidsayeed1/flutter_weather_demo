import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../app/config/app_colors.dart';
import '../../../app/util/app_assets.dart';
import '../../widgets/add_space.dart';
import '../../widgets/app_text.dart';
import '../weather_controller.dart';

class BuildDailyWidget extends GetWidget<WeatherController> {
  const BuildDailyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // var data = controller.weatherData!.weatherData!.daily!.dailyForecasts;

    return Container(
      margin: EdgeInsets.all(20.r),
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
          color: AppColors.lightGray.withOpacity(0.4),
          borderRadius: BorderRadius.circular(20.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            text: '03-DAY FORECAST',
            fontSize: 18.sp,
            fontWeight: FontWeight.w400,
            lineHeight: 0.9,
            color: AppColors.textfeildBg.withOpacity(0.8),
          ),
          Divider(
            color: AppColors.lightGray,
          ),
          AddSpace.vertical(10.h),
          Column(
            children: List.generate(
                3, // data!.length,
                (index) => Container(
                      margin: EdgeInsets.only(right: 15.w),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: Get.width,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Expanded(flex: 1, child: SizedBox()),
                                Expanded(
                                  flex: 3,
                                  child: AppText(
                                    text: 'Today',

                                    // index == 0
                                    //     ? 'Today'
                                    //     : dayFarmater(
                                    //             data[index].date.toString())
                                    //         .substring(0, 3),
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w400,
                                    lineHeight: 1.6,
                                  ),
                                ),
                                const Expanded(flex: 1, child: SizedBox()),
                                Expanded(
                                    flex: 2,
                                    child: Image.asset(
                                        WeatherAssets.getIcon(index + 1))),
                                const Expanded(flex: 1, child: SizedBox()),
                                Expanded(
                                  flex: 2,
                                  child: AppText(
                                    text:
                                        '66°', //  '${celsiusTemp(data[index].temperature!.minimum!.value.toString())}°', //'66°',
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.w400,
                                    lineHeight: 1.6,
                                    color:
                                        AppColors.textfeildBg.withOpacity(0.8),
                                  ),
                                ),
                                Expanded(
                                    flex: 3,
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 15.w),
                                      height: 5.h,
                                      decoration: BoxDecoration(
                                        gradient: const LinearGradient(colors: [
                                          Colors.green,
                                          Colors.yellow,
                                          Colors.red
                                        ]),
                                        borderRadius:
                                            BorderRadius.circular(30.r),
                                      ),
                                    )),
                                Expanded(
                                  flex: 2,
                                  child: AppText(
                                    text:
                                        '85°', //  '${celsiusTemp(data[index].temperature!.maximum!.value.toString())}°', //'85°',
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.w400,
                                    lineHeight: 1.6,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            height: 4,
                            color: AppColors.lightGray,
                          ),
                        ],
                      ),
                    )),
          )
        ],
      ),
    );
  }

  String dayFarmater(String time) {
    DateFormat dateFormat = DateFormat("EEEE");
    DateTime dateTime = DateTime.parse(time).toLocal();
    return dateFormat.format(dateTime);
  }

  String celsiusTemp(String f) {
    return (((double.parse(f) - 32) * 5) / 9).toString().split('.').first;
  }
}
