import '../../../domain/entities/directions/direction_entity.dart';

import '../../model/directions/directions_model.dart';

import '../../web_service/directions/directions_web_service.dart';
import '../../../domain/repository/directions/directions_repository.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DirectionsRepositoryImpl implements DirectionsRepository {
  final DirectionsRemoteDataSource remoteDataSource;

  DirectionsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<DirectionsEntity> getDirections(
    LatLng origin,
    LatLng destination,
  ) async {
    final DirectionsModel model = await remoteDataSource.getDirections(
      origin,
      destination,
    );
    return model;
  }
}
