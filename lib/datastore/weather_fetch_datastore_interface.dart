import 'package:weather_app_flutter_mvvm/model/response/weathre_response_model.dart';

abstract class WeatherFetchDataStoreInterface {
  Future<WeatherResponseModel> fetchWeatherByCity({
    required String city,
  });
  Future<WeatherResponseModel> fetchWeatherByLocation({
    required double lat,
    required double lon,
  });
}
