import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app_flutter_mvvm/datastore/provider/weather_fetch_datastore_provider.dart';
import 'package:weather_app_flutter_mvvm/repository/weather_repository.dart';
import 'package:weather_app_flutter_mvvm/repository/weather_repository_interface.dart';

final weatherRepositoryProvider = Provider<WeatherRepositoryInterface>(
  (ref) => WeatherRepository(
    dataStore: ref.read(weatherFetchDataStoreProvider),
  ),
);
