import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class WeatherModel {
  DateTime date;
  double temp;
  double minTemp;
  double maxTemp;
  String weatherstatename;

  WeatherModel(
      {required this.date,
      required this.temp,
      required this.minTemp,
      required this.maxTemp,
      required this.weatherstatename});
  factory WeatherModel.fromJson(dynamic data) {
    var json = data['forcast']['forcastday']['0']['day'];
    // date = data['forcast']['forcastday'];
    //temp = json['avgtemp_c'];
    //minTemp = json['mintemp_c'];
    //maxTemp = json['maxtemp_c'];
    //weatherstatename = json['condition']['text'];
    return WeatherModel(
        date: DateTime.parse(data['forcast']['forcastday']),
        temp: json['avgtemp_c'],
        minTemp: json['mintemp_c'],
        maxTemp: json['maxtemp_c'],
        weatherstatename: json['condition']['text']);
  }
  @override
  String toString() {
    return 'min temp = ${temp} data=${date}';
  }

  MaterialColor? getThemeColor() {
    if (weatherstatename == 'Sunny') {
      return Colors.orange;
    } else if (weatherstatename == 'Clear' ||
        weatherstatename == 'Light Cloud' ||
        weatherstatename == 'Snow' ||
        weatherstatename == 'Sleet' ||
        weatherstatename == 'Hail') {
      return Colors.blue;
    } else if (weatherstatename == 'Heavy Cloud') {
      Colors.blueGrey;
    } else if (weatherstatename == 'Partly cloudy') {
      Colors.grey;
    } else if (weatherstatename == 'Light Rain' ||
        weatherstatename == 'heavy Rain' ||
        weatherstatename == 'Patchy rain possible' ||
        weatherstatename == 'Moderate rain') {
      return Colors.blue;
    } else {
      return Colors.cyan;
    }
  }

/*
 String getImage() {
  if (weatherstatename == "Thunderstorm") {
    return 'lib/assets/assets/thunderstorm.png';
  }
}*/

}

