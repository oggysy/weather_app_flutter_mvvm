import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:weather_app_flutter_mvvm/ui/detail/component/weather_icon.dart';

class WeatherListCell extends StatelessWidget {
  final String time;
  final String imageName;
  final String maxTemperature;
  final String minTemperature;
  final String humidityLevel;
  const WeatherListCell({
    required this.maxTemperature,
    required this.minTemperature,
    required this.humidityLevel,
    required this.imageName,
    required this.time,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Text(time),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: WeathreIcon(imageName),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '最高気温:$maxTemperature ℃',
                style: const TextStyle(
                  color: Colors.red,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                '最低気温:$minTemperature ℃',
                style: const TextStyle(
                  color: Colors.blue,
                ),
              ),
              const Gap(5),
              Text(
                '湿度:$humidityLevel %',
                style: const TextStyle(
                  color: Colors.green,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
