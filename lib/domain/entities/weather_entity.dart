class WeatherEntity {
  final String? message;
  final String? lat, lng;
  WeatherEntity({
    this.message,
    this.lat,
    this.lng,
  });

  Map<String, dynamic> toMap() {
    return {
      'latitude': lat,
      'longitude': lng,
      'current': 'temperature_2m',
      'daily':
          'weathercode,temperature_2m_max,temperature_2m_min,sunrise,sunset',
      'timezone': 'auto',
      'past_days': '3'
    };
  }
}
