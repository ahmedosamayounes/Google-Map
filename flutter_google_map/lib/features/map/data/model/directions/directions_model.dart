
import '../../../domain/entities/directions/direction_entity.dart';

class DirectionsModel extends DirectionsEntity {
  DirectionsModel({
    required super.polylineGeo,
    required super.distance,
    required super.duration,
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