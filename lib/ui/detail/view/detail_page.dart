import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:weather_app_flutter_mvvm/extension/int_extension.dart';
import 'package:weather_app_flutter_mvvm/model/response/weathre_response_model.dart';
import 'package:weather_app_flutter_mvvm/ui/detail/component/pop_chart.dart';
import 'package:weather_app_flutter_mvvm/ui/detail/view_model/detail_view_model.dart';

class DetailPage extends ConsumerStatefulWidget {
  const DetailPage(this.prefecture, {super.key});

  final String prefecture;

  @override
  ConsumerState<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends ConsumerState<DetailPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref
          .read(detailViewModelProvider.notifier)
          .fetchWeatherByCity(widget.prefecture);
    });
  }

  @override
  Widget build(BuildContext context) {
    final uiState = ref.watch(detailViewModelProvider);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: uiState.when(data: (data) {
          if (data == null) {
            return const CircularProgressIndicator();
          }
          return Column(
            children: [
              Text(
                data.city,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              const Text('2024年5月13日'),
              const Text('降水確率'),
              SizedBox(
                width: double.infinity,
                height: 200.0,
                child: Padding(
                  padding: const EdgeInsets.all(
                    8.0,
                  ),
                  child: PopChart(
                    timePopData: data.chartData,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: data.threeHoursWeather.length,
                  itemBuilder: (context, index) {
                    String date = data.threeHoursWeather.keys.elementAt(index);
                    List<WeatherData>? threeHourWethers =
                        data.threeHoursWeather[date];
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
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: _WeatherListCell(
                                  maxTemperature:
                                      event.main.temp_max.toStringAsFixed(1),
                                  minTemperature:
                                      event.main.temp_min.toStringAsFixed(1),
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
                ),
              ),
            ],
          );
        }, error: (e, s) {
          return Text(e.toString());
        }, loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }),
      ),
    );
  }
}

class _WeatherListCell extends StatelessWidget {
  final String time;
  final String imageName;
  final String maxTemperature;
  final String minTemperature;
  final String humidityLevel;
  const _WeatherListCell({
    required this.maxTemperature,
    required this.minTemperature,
    required this.humidityLevel,
    required this.imageName,
    required this.time,
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
            child: Consumer(
              builder: (context, ref, _) {
                final image = ref
                    .watch(detailViewModelProvider.notifier)
                    .fetchIconImage(iconName: imageName);
                return FutureBuilder(
                  future: image,
                  builder: (BuildContext context,
                      AsyncSnapshot<Uint8List?> snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.done:
                        if (snapshot.hasData) {
                          return Image.memory(
                            snapshot.data!,
                            width: 50,
                            height: 50,
                          );
                        } else {
                          return const Text('No data');
                        }
                      case ConnectionState.waiting:
                      case ConnectionState.none:
                        return const SizedBox(
                          width: 50,
                          height: 50,
                        );
                      default:
                        return const Text('No data');
                    }
                  },
                );
              },
            ),
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
