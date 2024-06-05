import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app_flutter_mvvm/datastore/location_datastore.dart';
import 'package:weather_app_flutter_mvvm/datastore/location_datastore_interface.dart';

final locationDataStoreProvider = Provider<LocationDataStoreInterface>(
  (ref) => LocationDataStore(),
);
