import 'package:geolocator/geolocator.dart';

class LocationHelper {
  static Future<Position> getCurrentLocation() async {
    // 1. Check if the device GPS (Location Service) is turned on
    bool isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isServiceEnabled) {
      // If GPS is off, open the phone settings so the user can turn it on
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    // 2. Check if the app has permission to access the location
    LocationPermission permission = await Geolocator.checkPermission();

    // If permission is not given yet, ask the user for it
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // If the user rejects the permission request
        return Future.error('Location permissions are denied');
      }
    }

    // If the user blocked the permission permanently from phone settings
    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied.');
    }

    // 3. When GPS is on and permission is granted, get the current position
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }
}
