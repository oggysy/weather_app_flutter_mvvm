import 'package:geolocator/geolocator.dart';

abstract class LocationDataStoreInterface {
  Future<bool> requestPermission();
  Future<Position> getCurrentLocation();
}
