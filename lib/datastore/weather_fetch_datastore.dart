import 'package:dio/dio.dart';
import 'package:weather_app_flutter_mvvm/datastore/weather_fetch_datastore_interface.dart';
import 'package:weather_app_flutter_mvvm/model/request/weather_request_model.dart';
import 'package:weather_app_flutter_mvvm/model/response/weathre_response_model.dart';
import '../env/env.dart';

class WeatherFetchDataStore implements WeatherFetchDataStoreInterface {
  final Dio dio;
  WeatherFetchDataStore({required this.dio});

  final String _baseUrl = "https://api.openweathermap.org/data/2.5/forecast";
  final String _apikey = Env.key;

  @override
  Future<WeatherResponseModel> fetchWeatherByCity({
    required String city,
  }) async {
    final request = WeatherRequestModel.byCity(
      city: city,
      appid: _apikey,
    );
    return _fetchWeather(parameter: request.toQueryParameters());
  }

  @override
  Future<WeatherResponseModel> fetchWeatherByLocation({
    required double lat,
    required double lon,
  }) async {
    final request = WeatherRequestModel.byLocation(
      lat: lat,
      lon: lon,
      appid: _apikey,
    );
    return _fetchWeather(parameter: request.toQueryParameters());
  }

  Future<WeatherResponseModel> _fetchWeather(
      {required Map<String, dynamic> parameter}) async {
    try {
      final response = await dio.get(_baseUrl, queryParameters: parameter);
      return WeatherResponseModel.fromJson(response.data);
    } on Exception catch (exception) {
      throw Exception(exception);
    }
  }
}
