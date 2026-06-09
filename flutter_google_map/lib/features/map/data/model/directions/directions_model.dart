class DirectionsModel {
  final String polylineGeo;
  final double distance;
  final double duration;

  DirectionsModel({
    required this.polylineGeo,
    required this.distance,
    required this.duration,
  });

  factory DirectionsModel.fromJson(Map<String, dynamic> json) {
    final route = json['routes'][0];

    return DirectionsModel(
      polylineGeo: route['geometry'] as String,
      distance: (route['distance'] as num).toDouble(),
      duration: (route['duration'] as num).toDouble(),
    );
  }
}
