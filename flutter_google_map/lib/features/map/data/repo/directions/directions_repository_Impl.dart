import 'package:flutter_google_map/features/map/data/model/directions/directions_model.dart';

import '../../web_service/directions/directions_web_service.dart';
import '../../../domain/directions/directions_repository.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DirectionsRepositoryImpl implements DirectionsRepository {
  final DirectionsRemoteDataSource remoteDataSource;

  DirectionsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<DirectionsModel> getDirections(
    LatLng origin,
    LatLng destination,
  ) async {
    return await remoteDataSource.getDirections(origin, destination);
  }
}
