import 'package:flutter/material.dart';
import 'package:flutter_application_2_weather/models/weathermodel.dart';
import 'package:flutter_application_2_weather/pages/homepage.dart';
import 'package:flutter_application_2_weather/providers/weatherProvider.dart';
import 'package:flutter_application_2_weather/services/weather_services.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  String? data, city;

  SearchPage({this.updateUi});
  VoidCallback? updateUi;
  //get city => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a city'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 100),
        child: TextField(
          onSubmitted: (Data) async {
            city = Data;
            WeatherServices service = WeatherServices();
            WeatherModel weather = await service.getnamecity(city: city!);
            // print(weather);
            Provider.of<weatherProvider>(context,listen: false).weatherData = weather;
                        Provider.of<weatherProvider>(context, listen: false).city =
                city;

       
            Navigator.pop(context);
          },
          decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 25, horizontal: 24),
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
