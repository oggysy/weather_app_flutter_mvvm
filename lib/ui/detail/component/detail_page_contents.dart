import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app_flutter_mvvm/extension/date_time_extension.dart';
import 'package:weather_app_flutter_mvvm/ui/componet/normal_alert_dialog.dart';
import 'package:weather_app_flutter_mvvm/ui/detail/component/pop_chart.dart';
import 'package:weather_app_flutter_mvvm/ui/detail/component/weather_list.dart';
import 'package:weather_app_flutter_mvvm/ui/detail/ui_state/detail_ui_state.dart';

class DetailPageContent extends ConsumerWidget {
  const DetailPageContent({
    super.key,
    required this.uiState,
  });
  final AsyncValue<DetailUiState> uiState;

  void showErrorDialog(BuildContext context, String message) {
    final errorMessage = message.replaceFirst('Exception: ', '');
    showDialog(
      context: context,
      builder: (context) {
        return NormalAlertDialog(
          title: 'エラー',
          message: errorMessage,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: uiState.when(
        data: (data) {
          final String currentDate = DateTime.now().asStringYMD;
          return Column(
            children: [
              Text(
                data.cityName,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              Text(currentDate),
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
          WidgetsBinding.instance.addPostFrameCallback((_) => showErrorDialog(
                context,
                e.toString(),
              ));
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
