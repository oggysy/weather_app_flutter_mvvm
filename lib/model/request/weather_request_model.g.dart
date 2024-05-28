// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ByCityImpl _$$ByCityImplFromJson(Map<String, dynamic> json) => _$ByCityImpl(
      city: json['city'] as String,
      units: json['units'] as String? ?? 'metric',
      lang: json['lang'] as String? ?? 'ja',
      appid: json['appid'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ByCityImplToJson(_$ByCityImpl instance) =>
    <String, dynamic>{
      'city': instance.city,
      'units': instance.units,
      'lang': instance.lang,
      'appid': instance.appid,
      'runtimeType': instance.$type,
    };

_$ByLocationImpl _$$ByLocationImplFromJson(Map<String, dynamic> json) =>
    _$ByLocationImpl(
      lat: (json['lat'] as num).toDouble(),
      lon: (json['lon'] as num).toDouble(),
      units: json['units'] as String? ?? 'metric',
      lang: json['lang'] as String? ?? 'ja',
      appid: json['appid'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ByLocationImplToJson(_$ByLocationImpl instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lon': instance.lon,
      'units': instance.units,
      'lang': instance.lang,
      'appid': instance.appid,
      'runtimeType': instance.$type,
    };
