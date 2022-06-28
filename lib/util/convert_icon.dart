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
          shadows: [
            Shadow(
                color: Colors.black,
                blurRadius: 2.0,
                offset: Offset.fromDirection(1.0))
          ],
          size: size,
        );
      }
      break;
    case "Clouds":
      {
        return Icon(FontAwesomeIcons.cloud,
            shadows: [
              Shadow(
                  color: Colors.black,
                  blurRadius: 2.0,
                  offset: Offset.fromDirection(1.0))
            ],
            color: Colors.lightBlueAccent,
            size: size);
      }
      break;
    case "Rain":
      {
        return Icon(
          FontAwesomeIcons.cloudRain,
          color: Colors.blueAccent,
          shadows: [
            Shadow(
                color: Colors.black,
                blurRadius: 2.0,
                offset: Offset.fromDirection(1.0))
          ],
          size: size,
        );
      }
      break;
    case "Snow":
      {
        return Icon(
          FontAwesomeIcons.snowman,
          color: Colors.blue[50],
          shadows: [
            Shadow(
                color: Colors.black,
                blurRadius: 5.0,
                offset: Offset.fromDirection(1.0))
          ],
          size: size,
        );
      }
      break;
    default:
      {
        return Icon(
          FontAwesomeIcons.sun,
          color: Colors.amber,
          shadows: [
            Shadow(
                color: Colors.black,
                blurRadius: 2.0,
                offset: Offset.fromDirection(1.0))
          ],
          size: size,
        );
      }
      break;
  }
}
