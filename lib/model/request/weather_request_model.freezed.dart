// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WeatherRequestModel _$WeatherRequestModelFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'byCity':
      return _ByCity.fromJson(json);
    case 'byLocation':
      return _ByLocation.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'WeatherRequestModel',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$WeatherRequestModel {
  String get units => throw _privateConstructorUsedError;
  String get lang => throw _privateConstructorUsedError;
  String get appid => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String city, String units, String lang, String appid)
        byCity,
    required TResult Function(
            double lat, double lon, String units, String lang, String appid)
        byLocation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String city, String units, String lang, String appid)?
        byCity,
    TResult? Function(
            double lat, double lon, String units, String lang, String appid)?
        byLocation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String city, String units, String lang, String appid)?
        byCity,
    TResult Function(
            double lat, double lon, String units, String lang, String appid)?
        byLocation,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ByCity value) byCity,
    required TResult Function(_ByLocation value) byLocation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ByCity value)? byCity,
    TResult? Function(_ByLocation value)? byLocation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ByCity value)? byCity,
    TResult Function(_ByLocation value)? byLocation,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeatherRequestModelCopyWith<WeatherRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherRequestModelCopyWith<$Res> {
  factory $WeatherRequestModelCopyWith(
          WeatherRequestModel value, $Res Function(WeatherRequestModel) then) =
      _$WeatherRequestModelCopyWithImpl<$Res, WeatherRequestModel>;
  @useResult
  $Res call({String units, String lang, String appid});
}

/// @nodoc
class _$WeatherRequestModelCopyWithImpl<$Res, $Val extends WeatherRequestModel>
    implements $WeatherRequestModelCopyWith<$Res> {
  _$WeatherRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? units = null,
    Object? lang = null,
    Object? appid = null,
  }) {
    return _then(_value.copyWith(
      units: null == units
          ? _value.units
          : units // ignore: cast_nullable_to_non_nullable
              as String,
      lang: null == lang
          ? _value.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as String,
      appid: null == appid
          ? _value.appid
          : appid // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ByCityImplCopyWith<$Res>
    implements $WeatherRequestModelCopyWith<$Res> {
  factory _$$ByCityImplCopyWith(
          _$ByCityImpl value, $Res Function(_$ByCityImpl) then) =
      __$$ByCityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String city, String units, String lang, String appid});
}

/// @nodoc
class __$$ByCityImplCopyWithImpl<$Res>
    extends _$WeatherRequestModelCopyWithImpl<$Res, _$ByCityImpl>
    implements _$$ByCityImplCopyWith<$Res> {
  __$$ByCityImplCopyWithImpl(
      _$ByCityImpl _value, $Res Function(_$ByCityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? city = null,
    Object? units = null,
    Object? lang = null,
    Object? appid = null,
  }) {
    return _then(_$ByCityImpl(
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      units: null == units
          ? _value.units
          : units // ignore: cast_nullable_to_non_nullable
              as String,
      lang: null == lang
          ? _value.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as String,
      appid: null == appid
          ? _value.appid
          : appid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ByCityImpl implements _ByCity {
  const _$ByCityImpl(
      {required this.city,
      this.units = 'metric',
      this.lang = 'ja',
      required this.appid,
      final String? $type})
      : $type = $type ?? 'byCity';

  factory _$ByCityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ByCityImplFromJson(json);

  @override
  final String city;
  @override
  @JsonKey()
  final String units;
  @override
  @JsonKey()
  final String lang;
  @override
  final String appid;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'WeatherRequestModel.byCity(city: $city, units: $units, lang: $lang, appid: $appid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ByCityImpl &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.units, units) || other.units == units) &&
            (identical(other.lang, lang) || other.lang == lang) &&
            (identical(other.appid, appid) || other.appid == appid));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, city, units, lang, appid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ByCityImplCopyWith<_$ByCityImpl> get copyWith =>
      __$$ByCityImplCopyWithImpl<_$ByCityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String city, String units, String lang, String appid)
        byCity,
    required TResult Function(
            double lat, double lon, String units, String lang, String appid)
        byLocation,
  }) {
    return byCity(city, units, lang, appid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String city, String units, String lang, String appid)?
        byCity,
    TResult? Function(
            double lat, double lon, String units, String lang, String appid)?
        byLocation,
  }) {
    return byCity?.call(city, units, lang, appid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String city, String units, String lang, String appid)?
        byCity,
    TResult Function(
            double lat, double lon, String units, String lang, String appid)?
        byLocation,
    required TResult orElse(),
  }) {
    if (byCity != null) {
      return byCity(city, units, lang, appid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ByCity value) byCity,
    required TResult Function(_ByLocation value) byLocation,
  }) {
    return byCity(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ByCity value)? byCity,
    TResult? Function(_ByLocation value)? byLocation,
  }) {
    return byCity?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ByCity value)? byCity,
    TResult Function(_ByLocation value)? byLocation,
    required TResult orElse(),
  }) {
    if (byCity != null) {
      return byCity(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ByCityImplToJson(
      this,
    );
  }
}

abstract class _ByCity implements WeatherRequestModel {
  const factory _ByCity(
      {required final String city,
      final String units,
      final String lang,
      required final String appid}) = _$ByCityImpl;

  factory _ByCity.fromJson(Map<String, dynamic> json) = _$ByCityImpl.fromJson;

  String get city;
  @override
  String get units;
  @override
  String get lang;
  @override
  String get appid;
  @override
  @JsonKey(ignore: true)
  _$$ByCityImplCopyWith<_$ByCityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ByLocationImplCopyWith<$Res>
    implements $WeatherRequestModelCopyWith<$Res> {
  factory _$$ByLocationImplCopyWith(
          _$ByLocationImpl value, $Res Function(_$ByLocationImpl) then) =
      __$$ByLocationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double lat, double lon, String units, String lang, String appid});
}

/// @nodoc
class __$$ByLocationImplCopyWithImpl<$Res>
    extends _$WeatherRequestModelCopyWithImpl<$Res, _$ByLocationImpl>
    implements _$$ByLocationImplCopyWith<$Res> {
  __$$ByLocationImplCopyWithImpl(
      _$ByLocationImpl _value, $Res Function(_$ByLocationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lon = null,
    Object? units = null,
    Object? lang = null,
    Object? appid = null,
  }) {
    return _then(_$ByLocationImpl(
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lon: null == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double,
      units: null == units
          ? _value.units
          : units // ignore: cast_nullable_to_non_nullable
              as String,
      lang: null == lang
          ? _value.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as String,
      appid: null == appid
          ? _value.appid
          : appid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ByLocationImpl implements _ByLocation {
  const _$ByLocationImpl(
      {required this.lat,
      required this.lon,
      this.units = 'metric',
      this.lang = 'ja',
      required this.appid,
      final String? $type})
      : $type = $type ?? 'byLocation';

  factory _$ByLocationImpl.fromJson(Map<String, dynamic> json) =>
      _$$ByLocationImplFromJson(json);

  @override
  final double lat;
  @override
  final double lon;
  @override
  @JsonKey()
  final String units;
  @override
  @JsonKey()
  final String lang;
  @override
  final String appid;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'WeatherRequestModel.byLocation(lat: $lat, lon: $lon, units: $units, lang: $lang, appid: $appid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ByLocationImpl &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lon, lon) || other.lon == lon) &&
            (identical(other.units, units) || other.units == units) &&
            (identical(other.lang, lang) || other.lang == lang) &&
            (identical(other.appid, appid) || other.appid == appid));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, lat, lon, units, lang, appid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ByLocationImplCopyWith<_$ByLocationImpl> get copyWith =>
      __$$ByLocationImplCopyWithImpl<_$ByLocationImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String city, String units, String lang, String appid)
        byCity,
    required TResult Function(
            double lat, double lon, String units, String lang, String appid)
        byLocation,
  }) {
    return byLocation(lat, lon, units, lang, appid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String city, String units, String lang, String appid)?
        byCity,
    TResult? Function(
            double lat, double lon, String units, String lang, String appid)?
        byLocation,
  }) {
    return byLocation?.call(lat, lon, units, lang, appid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String city, String units, String lang, String appid)?
        byCity,
    TResult Function(
            double lat, double lon, String units, String lang, String appid)?
        byLocation,
    required TResult orElse(),
  }) {
    if (byLocation != null) {
      return byLocation(lat, lon, units, lang, appid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ByCity value) byCity,
    required TResult Function(_ByLocation value) byLocation,
  }) {
    return byLocation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ByCity value)? byCity,
    TResult? Function(_ByLocation value)? byLocation,
  }) {
    return byLocation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ByCity value)? byCity,
    TResult Function(_ByLocation value)? byLocation,
    required TResult orElse(),
  }) {
    if (byLocation != null) {
      return byLocation(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ByLocationImplToJson(
      this,
    );
  }
}

abstract class _ByLocation implements WeatherRequestModel {
  const factory _ByLocation(
      {required final double lat,
      required final double lon,
      final String units,
      final String lang,
      required final String appid}) = _$ByLocationImpl;

  factory _ByLocation.fromJson(Map<String, dynamic> json) =
      _$ByLocationImpl.fromJson;

  double get lat;
  double get lon;
  @override
  String get units;
  @override
  String get lang;
  @override
  String get appid;
  @override
  @JsonKey(ignore: true)
  _$$ByLocationImplCopyWith<_$ByLocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
