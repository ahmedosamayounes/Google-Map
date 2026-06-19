import '../../../domain/entities/places/place_entity.dart';

import '../../model/places/place_model.dart';
import '../../web_service/places/places_web_service.dart';
import '../../../domain/repository/places/places_repository.dart';

// app router give him Instance to make cubit see him by (inject)
// 5 agree with the contract in PlacesRepository by implements PlacesRepository
class PlacesRepositoryImpl implements PlacesRepository {
  final PlacesRemoteDataSource remoteDataSource;

  PlacesRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<PlaceEntity>> searchPlaces(String query) async {
    // 6 give data to web serivce
    final List<PlaceModel> models = await remoteDataSource.searchPlaces(query);
    return models;
  }
}
