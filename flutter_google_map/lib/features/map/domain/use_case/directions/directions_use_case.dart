import '../../entities/directions/direction_entity.dart';
import '../../repository/directions/directions_repository.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DirectionsUseCase {
  final DirectionsRepository repository;
  DirectionsUseCase(this.repository);
  Future<DirectionsEntity> call(LatLng origin, LatLng destination) async {
    return await repository.getDirections(origin, destination);
  }
}
