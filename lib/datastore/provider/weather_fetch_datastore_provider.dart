import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app_flutter_mvvm/datastore/provider/dio_provider.dart';
import 'package:weather_app_flutter_mvvm/datastore/weather_fetch_datastore.dart';
import 'package:weather_app_flutter_mvvm/datastore/weather_fetch_datastore_interface.dart';

final weatherFetchDataStoreProvider = Provider<WeatherFetchDataStoreInterface>(
  (ref) => WeatherFetchDataStore(
    dio: ref.read(dioProvider),
  ),
);
