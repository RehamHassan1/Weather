import 'package:flutter/material.dart';
import 'package:flutter_application_2_weather/services/weather_services.dart';

class SearchPage extends StatelessWidget {
  String? data;

  //get city => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search a city'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 100),
        child: TextField(
          onSubmitted: (Data) {
            var city = Data;
            WeatherServices service = WeatherServices();
            service.getnamecity(city: city!);
          },
          decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 25, horizontal: 24),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              suffixIcon: const Icon(Icons.search),
              label: const Text('Search'),
              hintText: 'Enter City'),
        ),
      ),
    );
  }
}
