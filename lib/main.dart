import 'package:flutter/material.dart';
import 'data/weather_repository.dart';

void main() {
  final WeatherRepository weatherRepository = WeatherRepository();

  runApp(MyApp(weatherRepository: weatherRepository));
}

class MyApp extends StatelessWidget {
  final WeatherRepository weatherRepository;

  const MyApp({super.key, required this.weatherRepository});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WeatherApp(weatherRepository: weatherRepository),
    );
  }
}

class WeatherApp extends StatelessWidget {
  final WeatherRepository weatherRepository;

  const WeatherApp({super.key, required this.weatherRepository});

  @override
  Widget build(BuildContext context) {
    final weatherData = weatherRepository.getWeather();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Meine Wetter-App",
          style: TextStyle(
            color: Colors.lightBlue,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weatherData.city,
              style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 17, 14, 114)),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${weatherData.temperature}°C', // Konvertiere Temperatur in String
                  style: const TextStyle(fontSize: 24),
                ),
                const SizedBox(width: 16),
                Text(
                  weatherData.weatherCondition,
                  style: const TextStyle(fontSize: 24),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
