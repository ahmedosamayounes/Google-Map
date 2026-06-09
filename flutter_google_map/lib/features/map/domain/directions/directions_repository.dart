import '../../data/model/directions/directions_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class DirectionsRepository {
  Future<DirectionsModel> getDirections(LatLng origin, LatLng destination);
}
