import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class DirectionsState {}

class DirectionsInitial extends DirectionsState {}

class DirectionsLoading extends DirectionsState {}

class DirectionsLoaded extends DirectionsState {
  final List<LatLng> polylinePoints;
  final double distance;
  final double duration;

  DirectionsLoaded({
    required this.polylinePoints,
    required this.distance,
    required this.duration,
  });
}

class DirectionsError extends DirectionsState {
  final String errorMessage;
  DirectionsError({required this.errorMessage});
}
