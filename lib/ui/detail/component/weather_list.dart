import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import 'package:weather_app_flutter_mvvm/extension/int_extension.dart';
import 'package:weather_app_flutter_mvvm/model/response/weathre_response_model.dart';
import 'package:weather_app_flutter_mvvm/ui/detail/component/weather_list_cell.dart';

class WeatherList extends StatelessWidget {
  const WeatherList({required this.weathreData, super.key});

  final Map<String, List<WeatherData>> weathreData;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: weathreData.length,
      itemBuilder: (context, index) {
        String date = weathreData.keys.elementAt(index);
        List<WeatherData>? threeHourWethers = weathreData[date];
        if (threeHourWethers == null) {
          return const Text('データがありません');
        }
        return StickyHeader(
          header: Container(
            height: 30.0,
            color: const Color.fromARGB(249, 244, 244, 244),
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.centerLeft,
            child: Text(
              date,
            ),
          ),
          content: Column(
            children: threeHourWethers
                .map(
                  (event) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: WeatherListCell(
                      maxTemperature: event.main.tempMax.toStringAsFixed(1),
                      minTemperature: event.main.tempMin.toStringAsFixed(1),
                      humidityLevel: event.main.humidity.toString(),
                      imageName: event.weather.first.icon,
                      time: event.dt.toStringHHMMFromEpoch(),
                    ),
                  ),
                )
                .toList(),
          ),
        );
      },
    );
  }
}
