import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:weather_app_flutter_mvvm/ui/detail/component/pop_chart.dart';
import 'package:weather_app_flutter_mvvm/ui/detail/component/weather_list.dart';
import 'package:weather_app_flutter_mvvm/ui/detail/view_model/detail_view_model.dart';

class DetailPage extends HookConsumerWidget {
  const DetailPage(this.prefecture, {super.key});

  final String prefecture;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uiState = ref.watch(detailViewModelProvider);
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) {
          ref
              .read(detailViewModelProvider.notifier)
              .fetchWeatherByCity(prefecture);
        },
      );
      return null;
    }, const []);

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: uiState.when(data: (data) {
          return Column(
            children: [
              Text(
                data.cityName,
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
                child: WeatherList(weathreData: data.threeHoursWeather),
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
