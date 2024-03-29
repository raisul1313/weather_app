import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_forecast_model.dart';
import 'package:weather_app/network/network.dart';
import 'package:weather_app/ui/bottom_view.dart';
import 'package:weather_app/ui/mid_view.dart';

class WeatherForecast extends StatefulWidget {
  const WeatherForecast({Key? key}) : super(key: key);

  @override
  State<WeatherForecast> createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {
  late Future<WeatherForecastModel> forecastObject;
  String _cityName = "Dhaka";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    forecastObject = getWeather(cityName: _cityName);
    /*forecastObject.then((weather) {
      print(weather.list?[0].weather?[0].main);
    });*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            textFiledView(),
            Container(
              child: FutureBuilder<WeatherForecastModel>(
                  future: forecastObject,
                  builder: (BuildContext context,
                      AsyncSnapshot<WeatherForecastModel> snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: [
                          MidView(snapshot: snapshot), // type 1
                          BottomView(snapshot: snapshot), // type 1
                          //midView(snapshot), //type 2
                          //bottomView(snapshot, context), // type 2
                        ],
                      );
                    } else {
                      return Container(
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }

  Widget textFiledView() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Enter City Name',
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            contentPadding: EdgeInsets.all(8),
          ),
          onSubmitted: (value) {
            setState(() {
              _cityName = value;
              forecastObject = getWeather(cityName: _cityName);
            });
          },
        ),
      ),
    );
  }

  Future<WeatherForecastModel> getWeather({required String cityName}) =>
      Network().getWeatherForecast(cityName: _cityName);
}
