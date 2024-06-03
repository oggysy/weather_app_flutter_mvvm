import 'package:geolocator/geolocator.dart';
import 'package:weather_app_flutter_mvvm/datastore/location_datastore_interface.dart';
import 'package:weather_app_flutter_mvvm/repository/location_repository.dart';

class LocationRepository implements LocationRepositoryInterface {
  final LocationDataStoreInterface dataStore;

  LocationRepository({required this.dataStore});

  @override
  Future<bool> requestPermission() async {
    return await dataStore.requestPermission();
  }

  @override
  Future<Position> getCurrentLocation() async {
    try {
      return await dataStore.getCurrentLocation();
    } catch (exception) {
      throw Exception(exception);
    }
  }
}
