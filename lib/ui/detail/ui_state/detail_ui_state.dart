import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app_flutter_mvvm/extension/weather_response_extension.dart';
import 'package:weather_app_flutter_mvvm/model/response/weathre_response_model.dart';

part 'detail_ui_state.freezed.dart';

@freezed
class DetailUiState with _$DetailUiState {
  const factory DetailUiState({
    required String cityName,
    required List<Map<String, int>> chartData,
    required Map<String, List<WeatherData>> threeHoursWeather,
  }) = _DetailUiState;

  factory DetailUiState.fromWeatherResponse(
      WeatherResponseModel weatherResponseModel) {
    return DetailUiState(
      cityName: weatherResponseModel.city.name,
      chartData: weatherResponseModel.timeAndPopList,
      threeHoursWeather: weatherResponseModel.groupByDate(),
    );
  }
}
