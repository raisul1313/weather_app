import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/model/weather_forecast_model.dart';
import 'package:weather_app/util/forecast_util.dart';

class Network {
  Future<WeatherForecastModel> getWeatherForecast(
      {required String cityName}) async {
    var finalUrl = "https://api.openweathermap.org/data/2.5/forecast?q=" +
        cityName +
        "&cnt=7&appid=" +
        Util.appId +
        "&units=metric";

    final response = await http.get(Uri.parse(finalUrl));
    print("URL: ${(Uri.parse(finalUrl))}");

    if (response.statusCode == 200) {
      //we get actual mapped model (dart object)
      print("Weather data: ${response.body}");
      return WeatherForecastModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Error getting weather");
    }
  }
}
