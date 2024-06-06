import 'dart:typed_data';

import 'package:weather_app_flutter_mvvm/model/response/weathre_response_model.dart';

abstract class WeatherRepositoryInterface {
  Future<WeatherResponseModel> fetchWeatherByCity({
    required String city,
  });
  Future<WeatherResponseModel> fetchWeatherByLocation({
    required double lat,
    required double lon,
  });

  Future<Uint8List> fetchIconImage({
    required String iconName,
  });
}
