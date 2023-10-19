import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:weather_test/presentation/weather/weather_page.dart';

import 'route_page_strings.dart';

appRoutes() => [
      GetPage(
        name: RoutePageString.weather,
        page: () => WeatherPage(),
        middlewares: [MyMiddelware()],
        // transition: Transition.rightToLeft,
      ),
    ];

class MyMiddelware extends GetMiddleware {
  @override
  GetPage? onPageCalled(GetPage? page) {
    debugPrint(page?.name);
    return super.onPageCalled(page);
  }
}
