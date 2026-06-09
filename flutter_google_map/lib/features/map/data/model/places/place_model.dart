class PlaceModel {
  final String displayName;
  final double latitude;
  final double longitude;

  PlaceModel({
    required this.displayName,
    required this.latitude,
    required this.longitude,
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
