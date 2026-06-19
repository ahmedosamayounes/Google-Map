import '../../entities/directions/direction_entity.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class DirectionsRepository {
  Future<DirectionsEntity> getDirections(LatLng origin, LatLng destination);

}
