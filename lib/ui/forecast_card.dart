import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_forecast_model.dart';
import 'package:weather_app/util/forecast_util.dart';

Widget forecastCard(AsyncSnapshot<WeatherForecastModel> snapshot, int index) {
  var forecastList = snapshot.data?.list;
  var dayOfWeek = "";
  DateTime date = DateTime.fromMillisecondsSinceEpoch((forecastList?[index].dt)! * 1000);
  var fullDate = Util.getFormattedDate(date); //[Saturday, June 1 ,2022] full date
  dayOfWeek = fullDate.split(',').elementAt(0); //[Saturday] split and take only the day name

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(dayOfWeek),
    ],
  );
}
