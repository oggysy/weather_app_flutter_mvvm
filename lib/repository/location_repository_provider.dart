import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app_flutter_mvvm/datastore/location_datastore_provider.dart';
import 'package:weather_app_flutter_mvvm/repository/location_repository.dart';
import 'package:weather_app_flutter_mvvm/repository/location_repository_interface.dart';

final locationrRepositoryProvider = Provider<LocationRepositoryInterface>(
  (ref) => LocationRepository(
    dataStore: ref.read(
      locationDataStoreProvider,
    ),
  ),
);
