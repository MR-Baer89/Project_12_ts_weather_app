import 'weather_data.dart';

class WeatherRepository {
  final WeatherData _weatherData = WeatherData(
      city: "Freilingen", temperature: 21, weatherCondition: "Sonnig");

  WeatherData getWeather() {
    return _weatherData;
  }
}
