import 'package:flutter/material.dart';
import 'package:flutter_application_2_weather/models/weathermodel.dart';

class weatherProvider extends ChangeNotifier {
  WeatherModel? _weatherData;
  String? city;
  set weatherData(WeatherModel? weather) {
    _weatherData = weather;
    notifyListeners();
  }

  WeatherModel? get weatherData => _weatherData;
}
