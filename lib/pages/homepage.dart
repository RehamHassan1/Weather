import 'package:flutter/material.dart';
import 'package:flutter_application_2_weather/pages/search.dart';
import 'package:flutter_application_2_weather/models/weathermodel.dart';
import 'package:flutter_application_2_weather/providers/weatherProvider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void updateUi() {
    setState(() {});
  }

  WeatherModel? weatherData;
  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<weatherProvider>(context).weatherData;
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SearchPage(
                      updateUi: updateUi,
                    );
                  }));
                },
                icon: const Icon(Icons.search))
          ],
        ),
        body: weatherData == null
            ? const Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'there is no weather 😔 start',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                    Text(
                      'searching now 🔍',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    )
                  ],
                ),
              )
            : Container(
              decoration: BoxDecoration(
gradient: LinearGradient(colors: [
Provider.of<weatherProvider>(context)
                      .weatherData!
                      .getThemeColor()!,
                  Colors.white60,

],begin: Alignment.topCenter,end: Alignment.bottomCenter)
              ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                     Text(
                      Provider.of<weatherProvider>(context).city! ,
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                     Text(
                      'Updated : ${weatherData!.date.hour.toString()}:${weatherData!.date.minute.toString()}',
                      style: TextStyle( 
                        fontSize: 15,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset('lib/assets/assets/clear.png'),
                         Text(
                          '${weatherData!.temp.toInt()}',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                         Column(
                          children: [
                            Text('maxTemp : ${weatherData!.maxTemp.toInt()}'),
                            Text('minTemp : ${weatherData!.minTemp.toInt()}'),
                          ],
                        )
                      ],
                    ),
                    const Spacer(), 
                     Text(
                      weatherData!.weatherstatename ,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(
                      flex: 3,
                    ),
                  ],
                ),
              ));
  }
}
