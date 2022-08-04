import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_forecast_model.dart';
import 'package:weather_app/ui/forecast_card.dart';

//better way to doing business !! type 1
class BottomView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecastModel> snapshot;
  const BottomView({Key? key, required this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Weather Forecast",
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height / 2.8,
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 13),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => SizedBox(
              width: 8,
            ),
            itemCount: (snapshot.data?.list?.length)!,
            itemBuilder: (context, index) => ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: MediaQuery.of(context).size.width / 2.2,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.grey, Colors.white],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight),
                ),
                child: forecastCard(snapshot, index),
              ),
            ),
          ),
        )
      ],
    );
  }
}


//or also work that way. type 2
/*Widget bottomView(
    AsyncSnapshot<WeatherForecastModel> snapshot, BuildContext context) {
  var forecastList = snapshot.data?.list;
  return Column(
    children: [
      Text(
        "Weather Forecast",
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
      Container(
        height: MediaQuery.of(context).size.height / 2.6,
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => SizedBox(
            width: 8,
          ),
          itemCount: (forecastList?.length)!,
          itemBuilder: (context, index) => ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: MediaQuery.of(context).size.width / 2.2,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.grey, Colors.white],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
              ),
              child: forecastCard(snapshot, index),
            ),
          ),
        ),
      )
    ],
  );
}*/
