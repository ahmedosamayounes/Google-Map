import '../../data/model/places/place_model.dart';

// 4 take data from cubit
// Dependency Inversion
// its like contract
abstract class PlacesRepository {
  Future<List<PlaceModel>> searchPlaces(String query);
}
