
import '../../../domain/entities/places/place_entity.dart';

class PlaceModel extends PlaceEntity {
  PlaceModel({
    required super.displayName,
    required super.latitude,
    required super.longitude,
  });

  factory PlaceModel.fromJson(Map<String, dynamic> json) {
    return PlaceModel(
      displayName: json['display_name'] ?? '',
      latitude: json['lat'] is String
          ? double.parse(json['lat'])
          : (json['lat'] as num).toDouble(),
      longitude: json['lon'] is String
          ? double.parse(json['lon'])
          : (json['lon'] as num).toDouble(),
    );
  }
}