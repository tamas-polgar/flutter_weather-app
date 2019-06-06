import 'package:flutter/material.dart';
import 'package:flutter_weather/src/model/weather.dart';
import 'package:flutter_weather/src/utils/WeatherIconMapper.dart';
import 'package:flutter_weather/src/widgets/value_tile.dart';
import 'package:intl/intl.dart';

class ForecastHorizontal extends StatelessWidget {
  const ForecastHorizontal({
    Key key,
    @required this.weathers,
  }) : super(key: key);

  final List<Weather> weathers;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: this.weathers.length,
        separatorBuilder: (context, index) => Divider(
              height: 100,
              color: Colors.white,
            ),
        padding: EdgeInsets.only(left: 10, right: 10),
        itemBuilder: (context, index) {
          final item = this.weathers[index];
          return Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Center(
                child: ValueTile(
              DateFormat('h aa').format(
                  DateTime.fromMillisecondsSinceEpoch(item.time * 1000)),
              '${item.temperature.celsius.round()}°',
              iconData: WeatherIcons.rain_day,
            )),
          );
        },
      ),
    );
  }

  IconData getIcon(String iconCode){
    switch(iconCode){
      case '01d': return WeatherIcons.clear_day;
      case '01n': return WeatherIcons.clear_night;
      case '02d': return WeatherIcons.clear_day;
      case '02n': return WeatherIcons.clear_night;
      case '03d': return WeatherIcons.clear_day;
      case '03n': return WeatherIcons.clear_night;
      case '04d': return WeatherIcons.clear_day;
      case '04n': return WeatherIcons.clear_night;
      case '09d': return WeatherIcons.clear_day;
      case '09n': return WeatherIcons.clear_night;

    }
  }
}
