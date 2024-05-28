import 'package:weather_app_flutter_mvvm/datastore/weather_fetch_datastore_interface.dart';
import 'package:weather_app_flutter_mvvm/model/response/weathre_response_model.dart';
import 'package:weather_app_flutter_mvvm/repository/weather_repository_interface.dart';

class WeatherRepository implements WeatherRepositoryInterface {
  final WeatherFetchDataStoreInterface dataStore;
  WeatherRepository({required this.dataStore});

  @override
  Future<WeatherResponseModel> fetchWeatherByCity({
    required String city,
  }) async {
    try {
      final data = await dataStore.fetchWeatherByCity(
        city: city,
      );
      return data;
    } on Exception catch (exception) {
      throw Exception(exception);
    }
  }

  @override
  Future<WeatherResponseModel> fetchWeatherByLocation({
    required double lat,
    required double lon,
  }) async {
    try {
      final data = await dataStore.fetchWeatherByLocation(
        lat: lat,
        lon: lon,
      );
      return data;
    } on Exception catch (exception) {
      throw Exception(exception);
    }
  }
}
