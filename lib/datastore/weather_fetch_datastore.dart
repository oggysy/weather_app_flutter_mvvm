import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:weather_app_flutter_mvvm/datastore/weather_fetch_datastore_interface.dart';
import 'package:weather_app_flutter_mvvm/model/request/weather_request_model.dart';
import 'package:weather_app_flutter_mvvm/model/response/weathre_response_model.dart';
import '../env/env.dart';

class WeatherFetchDataStore implements WeatherFetchDataStoreInterface {
  final Dio dio;
  WeatherFetchDataStore({required this.dio});

  final String _baseUrl = "https://api.openweathermap.org/data/2.5/forecast";
  final String _imageUrl = 'https://openweathermap.org/img/wn/';
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

  @override
  Future<Uint8List> fetchIconImage({required String iconName}) async {
    try {
      final response = await dio.get(
        '$_imageUrl$iconName.png',
        options: Options(
          responseType: ResponseType.bytes,
        ),
      );
      return response.data;
    } on Exception catch (exception) {
      throw Exception(exception);
    }
  }

  Future<WeatherResponseModel> _fetchWeather(
      {required Map<String, dynamic> parameter}) async {
    try {
      final response = await dio.get(_baseUrl, queryParameters: parameter);
      try {
        final data = WeatherResponseModel.fromJson(response.data);
        return data;
      } catch (_) {
        throw Exception('デコード失敗');
      }
    } on DioException catch (dioException) {
      final message = _handleErrorMessage(dioException);
      throw Exception(message);
    } on Exception catch (exception) {
      throw Exception(exception);
    }
  }

  String _handleErrorMessage(DioException dioException) {
    if (dioException.type == DioExceptionType.connectionTimeout ||
        dioException.type == DioExceptionType.sendTimeout ||
        dioException.type == DioExceptionType.receiveTimeout) {
      return 'タイムアウトしました';
    } else if (dioException.type == DioExceptionType.badResponse) {
      final statusCode = dioException.response?.statusCode;
      if (statusCode == null) {
        return '不明なエラー';
      }
      if (statusCode >= 400 && statusCode < 500) {
        return 'クライエントエラー';
      } else if (statusCode >= 500 && statusCode < 600) {
        return 'サーバーエラー';
      } else {
        return '不明なエラー';
      }
    } else if (dioException.type == DioExceptionType.unknown) {
      return '不明なエラー';
    } else {
      return 'ネットワークに接続できませんでした。';
    }
  }
}
