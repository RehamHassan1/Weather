import 'package:flutter/material.dart';
import 'package:flutter_application_2_weather/models/weathermodel.dart';
import 'package:flutter_application_2_weather/pages/homepage.dart';
import 'package:flutter_application_2_weather/providers/weatherProvider.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(ChangeNotifierProvider(
      create: (context) {
        return weatherProvider();
      },
      child: await WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  WeatherApp({Key? key}) : super(key: key);
  WeatherModel? weather;
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        theme: ThemeData(primarySwatch: Provider.of<weatherProvider>(context).weatherData == null?Colors.blue:  Provider.of<weatherProvider>(context).weatherData!.getThemeColor() ),
        debugShowCheckedModeBanner: false,
        home: HomePage(),
     
    );
  }
}
