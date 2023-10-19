class WeatherIconModel {
  final String icon;
  final String text;
  WeatherIconModel(this.icon, this.text);
}

class WeatherAssets {
  static String getIcon(int key) => 'assets/weather/$key-s.png';
}
