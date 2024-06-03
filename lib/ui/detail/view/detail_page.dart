import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app_flutter_mvvm/ui/detail/component/pop_chart.dart';
import 'package:weather_app_flutter_mvvm/ui/detail/component/weather_list.dart';
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
