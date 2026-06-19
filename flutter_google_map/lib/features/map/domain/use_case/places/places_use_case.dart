import '../../entities/places/place_entity.dart';
import '../../repository/places/places_repository.dart';

class SearchPlacesUseCase {
  final PlacesRepository repository;

  SearchPlacesUseCase(this.repository);

  Future<List<PlaceEntity>> call(String query) async {
    return await repository.searchPlaces(query);
  }
}