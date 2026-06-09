import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/directions/directions_repository.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'directions_state.dart';

class DirectionsCubit extends Cubit<DirectionsState> {
  final DirectionsRepository directionsRepository;

  DirectionsCubit({required this.directionsRepository})
    : super(DirectionsInitial());

  Future<void> getDirections(LatLng origin, LatLng destination) async {
    emit(DirectionsLoading());

    try {
      final directions = await directionsRepository.getDirections(
        origin,
        destination,
      );
      // Decode the raw polyline string from the server into a list of points using flutter_polyline_point
      List<PointLatLng> decodedPoints = PolylinePoints.decodePolyline(
        directions.polylineGeo,
      );
      // Google Map doesn't understand PointLatLng, so we map decodedPoints to a list of LatLng
      // to be finalPolylinePoints (LatLng)
      List<LatLng> finalPolylinePoints = decodedPoints
          .map((point) => LatLng(point.latitude, point.longitude))
          .toList();

      emit(
        DirectionsLoaded(
          polylinePoints: finalPolylinePoints,
          distance: directions.distance,
          duration: directions.duration,
        ),
      );
    } catch (error) {
      emit(DirectionsError(errorMessage: error.toString()));
    }
  }
}
