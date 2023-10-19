import 'package:flutter/material.dart';
import 'package:weather_test/presentation/app.dart';
import 'package:weather_test/presentation/weather/weather_binding.dart';

import 'app/util/dependency.dart';

void main() async {
  DependencyCreator.init();
  WeatherBindings().dependencies();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}
