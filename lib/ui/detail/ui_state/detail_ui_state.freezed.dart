// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DetailUiState {
  String get cityName => throw _privateConstructorUsedError;
  List<Map<String, int>> get chartData => throw _privateConstructorUsedError;
  Map<String, List<WeatherData>> get threeHoursWeather =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DetailUiStateCopyWith<DetailUiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailUiStateCopyWith<$Res> {
  factory $DetailUiStateCopyWith(
          DetailUiState value, $Res Function(DetailUiState) then) =
      _$DetailUiStateCopyWithImpl<$Res, DetailUiState>;
  @useResult
  $Res call(
      {String cityName,
      List<Map<String, int>> chartData,
      Map<String, List<WeatherData>> threeHoursWeather});
}

/// @nodoc
class _$DetailUiStateCopyWithImpl<$Res, $Val extends DetailUiState>
    implements $DetailUiStateCopyWith<$Res> {
  _$DetailUiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cityName = null,
    Object? chartData = null,
    Object? threeHoursWeather = null,
  }) {
    return _then(_value.copyWith(
      cityName: null == cityName
          ? _value.cityName
          : cityName // ignore: cast_nullable_to_non_nullable
              as String,
      chartData: null == chartData
          ? _value.chartData
          : chartData // ignore: cast_nullable_to_non_nullable
              as List<Map<String, int>>,
      threeHoursWeather: null == threeHoursWeather
          ? _value.threeHoursWeather
          : threeHoursWeather // ignore: cast_nullable_to_non_nullable
              as Map<String, List<WeatherData>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DetailUiStateImplCopyWith<$Res>
    implements $DetailUiStateCopyWith<$Res> {
  factory _$$DetailUiStateImplCopyWith(
          _$DetailUiStateImpl value, $Res Function(_$DetailUiStateImpl) then) =
      __$$DetailUiStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String cityName,
      List<Map<String, int>> chartData,
      Map<String, List<WeatherData>> threeHoursWeather});
}

/// @nodoc
class __$$DetailUiStateImplCopyWithImpl<$Res>
    extends _$DetailUiStateCopyWithImpl<$Res, _$DetailUiStateImpl>
    implements _$$DetailUiStateImplCopyWith<$Res> {
  __$$DetailUiStateImplCopyWithImpl(
      _$DetailUiStateImpl _value, $Res Function(_$DetailUiStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cityName = null,
    Object? chartData = null,
    Object? threeHoursWeather = null,
  }) {
    return _then(_$DetailUiStateImpl(
      cityName: null == cityName
          ? _value.cityName
          : cityName // ignore: cast_nullable_to_non_nullable
              as String,
      chartData: null == chartData
          ? _value._chartData
          : chartData // ignore: cast_nullable_to_non_nullable
              as List<Map<String, int>>,
      threeHoursWeather: null == threeHoursWeather
          ? _value._threeHoursWeather
          : threeHoursWeather // ignore: cast_nullable_to_non_nullable
              as Map<String, List<WeatherData>>,
    ));
  }
}

/// @nodoc

class _$DetailUiStateImpl implements _DetailUiState {
  const _$DetailUiStateImpl(
      {required this.cityName,
      required final List<Map<String, int>> chartData,
      required final Map<String, List<WeatherData>> threeHoursWeather})
      : _chartData = chartData,
        _threeHoursWeather = threeHoursWeather;

  @override
  final String cityName;
  final List<Map<String, int>> _chartData;
  @override
  List<Map<String, int>> get chartData {
    if (_chartData is EqualUnmodifiableListView) return _chartData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chartData);
  }

  final Map<String, List<WeatherData>> _threeHoursWeather;
  @override
  Map<String, List<WeatherData>> get threeHoursWeather {
    if (_threeHoursWeather is EqualUnmodifiableMapView)
      return _threeHoursWeather;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_threeHoursWeather);
  }

  @override
  String toString() {
    return 'DetailUiState(cityName: $cityName, chartData: $chartData, threeHoursWeather: $threeHoursWeather)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailUiStateImpl &&
            (identical(other.cityName, cityName) ||
                other.cityName == cityName) &&
            const DeepCollectionEquality()
                .equals(other._chartData, _chartData) &&
            const DeepCollectionEquality()
                .equals(other._threeHoursWeather, _threeHoursWeather));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      cityName,
      const DeepCollectionEquality().hash(_chartData),
      const DeepCollectionEquality().hash(_threeHoursWeather));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailUiStateImplCopyWith<_$DetailUiStateImpl> get copyWith =>
      __$$DetailUiStateImplCopyWithImpl<_$DetailUiStateImpl>(this, _$identity);
}

abstract class _DetailUiState implements DetailUiState {
  const factory _DetailUiState(
          {required final String cityName,
          required final List<Map<String, int>> chartData,
          required final Map<String, List<WeatherData>> threeHoursWeather}) =
      _$DetailUiStateImpl;

  @override
  String get cityName;
  @override
  List<Map<String, int>> get chartData;
  @override
  Map<String, List<WeatherData>> get threeHoursWeather;
  @override
  @JsonKey(ignore: true)
  _$$DetailUiStateImplCopyWith<_$DetailUiStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
