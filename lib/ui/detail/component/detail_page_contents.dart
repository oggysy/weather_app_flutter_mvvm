import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app_flutter_mvvm/ui/componet/normal_alert_dialog.dart';
import 'package:weather_app_flutter_mvvm/ui/detail/component/pop_chart.dart';
import 'package:weather_app_flutter_mvvm/ui/detail/component/weather_list.dart';
import 'package:weather_app_flutter_mvvm/ui/detail/ui_state/detail_error_state.dart';
import 'package:weather_app_flutter_mvvm/ui/detail/ui_state/detail_ui_state.dart';

class DetailPageContent extends ConsumerWidget {
  const DetailPageContent({
    super.key,
    required this.uiState,
  });
  final AsyncValue<DetailUiState> uiState;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<String>(
      detailErrorStateProvider,
      (prev, next) {
        showDialog(
          context: context,
          builder: ((context) {
            return NormalAlertDialog(
              title: 'エラー',
              message: next,
            );
          }),
        );
      },
    );
    return Center(
      child: uiState.when(
        data: (data) {
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
                child: WeatherList(
                  weathreData: data.threeHoursWeather,
                ),
              ),
            ],
          );
        },
        error: (e, s) {
          return const Text('天気情報を取得できませんでした');
        },
        loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
