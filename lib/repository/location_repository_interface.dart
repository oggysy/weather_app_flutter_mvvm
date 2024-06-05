import 'package:geolocator/geolocator.dart';

abstract class LocationRepositoryInterface {
  Future<bool> requestPermission();
  Future<Position> getCurrentLocation();
}
