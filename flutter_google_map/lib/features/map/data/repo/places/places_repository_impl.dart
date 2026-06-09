import '../../model/places/place_model.dart';
import '../../web_service/places/places_web_service.dart';
import '../../../domain/places/places_repository.dart';

// app router give him Instance to make cubit see him by (inject)
// 5 agree with the contract in PlacesRepository by implements PlacesRepository
class PlacesRepositoryImpl implements PlacesRepository {
  final PlacesRemoteDataSource remoteDataSource;

  PlacesRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<PlaceModel>> searchPlaces(String query) async {
    // 6 give data to web serivce
    return await remoteDataSource.searchPlaces(query);
  }
}
