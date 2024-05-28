import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_request_model.freezed.dart';
part 'weather_request_model.g.dart';

@freezed
class WeatherRequestModel with _$WeatherRequestModel {
  const factory WeatherRequestModel.byCity({
    required String city,
    @Default('metric') String units,
    @Default('ja') String lang,
    required String appid,
  }) = _ByCity;

  const factory WeatherRequestModel.byLocation({
    required double lat,
    required double lon,
    @Default('metric') String units,
    @Default('ja') String lang,
    required String appid,
  }) = _ByLocation;

  factory WeatherRequestModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherRequestModelFromJson(json);
}
