class DirectionsEntity {
  final String polylineGeo;
  final double distance;
  final double duration;

  DirectionsEntity({
    required this.polylineGeo,
    required this.distance,
    required this.duration,
  });
}