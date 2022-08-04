import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/model/weather_forecast_model.dart';
import 'package:weather_app/util/convert_icon.dart';
import 'package:weather_app/util/forecast_util.dart';

Widget forecastCard(AsyncSnapshot<WeatherForecastModel> snapshot, int index) {
  var forecastList = snapshot.data?.list;
  var dayOfWeek = "";
  DateTime date =
      DateTime.fromMillisecondsSinceEpoch((forecastList?[index].dt)! * 1000);

  var fullDate =
      Util.getFormattedDate(date); //[Saturday, June 1 ,2022] full date
  dayOfWeek = fullDate
      .split(',')
      .elementAt(0); //[Saturday] split and take only the day name
  var fullTime = Util.getFormattedTime(date);

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(dayOfWeek + " " + fullTime + " (${((forecastList?[index].sys?.pod)! == "d" ? "Day" : "Night")})",
              style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ),
      Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
            child: getWeatherIcon(
                weatherDescription: (forecastList?[index].weather?[0].main)!,
                size: 45),
          ),
        ),
      ),
      Center(
          child: Text((forecastList?[index].weather?[0].description)!)),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                    "Max: ${forecastList?[index].main?.tempMax?.toStringAsFixed(0)}°C "),
                Icon(FontAwesomeIcons.arrowUp, size: 10, color: Colors.green),
              ],
            ),
            /*Text(
                "Max: ${forecastList?[index].main?.tempMax?.toStringAsFixed(0)}°C"),*/
            Row(
              children: [
                Text(
                    "Min: ${forecastList?[index].main?.tempMin?.toStringAsFixed(0)}°C  "),
                Icon(FontAwesomeIcons.arrowDown,
                    size: 10, color: Colors.red),
              ],
            ),
            Text(
                "Feels Like: ${((forecastList?[index].main?.feelsLike)!).toStringAsFixed(0)}°C"),
            Text(
                "Wind: ${((forecastList?[index].wind?.speed)! * 1.609).toStringAsFixed(0)} km/h"),
            Text(
                "Wind Gust: ${((forecastList?[index].wind?.gust)! * 1.609).toStringAsFixed(0)} km/h"),
            Text(
                "Humidity: ${forecastList?[index].main?.humidity?.toStringAsFixed(0)}%"),
            Text(
                "Pressure: ${forecastList?[index].main?.pressure?.toStringAsFixed(0)} hPa"),
          ],
        ),
      )
    ],
  );
}
