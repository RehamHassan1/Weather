import 'dart:convert';

import 'package:flutter_application_2_weather/models/weathermodel.dart';
import 'package:http/http.dart' as http;

class WeatherServices {
  String baseurl = 'http://api.weatherapi.com/v1',
      apikey = '2f2cffb114ba4b8a851111114231802';

  get date => null;
  Future<WeatherModel> getnamecity({required String city}) async {
    Uri url = Uri.parse('$baseurl/forecast.json?key=$apikey&q=$city&days=1');
    http.Response response = await http.get(url);
    Map<String, dynamic> data = jsonDecode(response.body);
    print(data);
    /*  WeatherModel weather = WeatherModel(
        date: date['location']['localtime'],
        temp: date['forcast']['forcastday']['0']['avgtemp_c'],
        minTemp: date['forcast']['forcastday']['0']['mintemp_c'],
        maxTemp: date['forcast']['forcastday']['0']['maxtemp_c'],
        weatherstatename: date['forcast']['forcastday']['0']['condition']
            ['text']);*/
    WeatherModel weather = WeatherModel.fromJson(data);
    return weather;
  }
}
