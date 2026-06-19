import '../../entities/places/place_entity.dart';

// 4 take data from cubit
// Dependency Inversion
// its like contract
abstract class PlacesRepository {
  Future<List<PlaceEntity>> searchPlaces(String query);
}
