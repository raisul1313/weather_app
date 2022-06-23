import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget getWeatherIcon(
    {required String weatherDescription, required double size}) {
  switch (weatherDescription) {
    case "Clear":
      {
        return Icon(
          FontAwesomeIcons.solidSun,
          color: Colors.amber,
          size: size,
        );
      }
      break;
    case "Clouds":
      {
        return Icon(FontAwesomeIcons.cloud, color: Colors.white, size: size);
      }
      break;
    case "Rain":
      {
        return Icon(
          FontAwesomeIcons.cloudRain,
          color: Colors.grey,
          size: size,
        );
      }
      break;
    case "Snow":
      {
        return Icon(
          FontAwesomeIcons.snowman,
          color: Colors.white,
          size: size,
        );
      }
      break;
    default:
      {
        return Icon(
          FontAwesomeIcons.sun,
          color: Colors.amber,
          size: size,
        );
      }
      break;
  }
}
