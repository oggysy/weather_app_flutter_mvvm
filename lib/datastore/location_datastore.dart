import 'package:geolocator/geolocator.dart';
import 'location_datastore_interface.dart';

class LocationDataStore implements LocationDataStoreInterface {
  @override
  Future<bool> requestPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever ||
          permission == LocationPermission.unableToDetermine) {
        return false;
      }
    }
    return permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always;
  }

  @override
  Future<Position> getCurrentLocation() async {
    final bool hasPermission = await requestPermission();
    if (!hasPermission) {
      Exception("位置情報が許可されていません");
    }
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
}
