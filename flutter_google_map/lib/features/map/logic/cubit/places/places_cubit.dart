import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/model/places/place_model.dart';
import '../../../domain/places/places_repository.dart';
import 'places_state.dart';

class PlacesCubit extends Cubit<PlacesState> {
  final PlacesRepository placesRepository;

  PlacesCubit({required this.placesRepository}) : super(PlacesInitial());
  // 2  data inside query , came from ui (suggestionsCallback)
  Future<List<PlaceModel>?> searchPlaces(String query) async {
    if (query.isEmpty) {
      emit(PlacesInitial());
      return [];
    }

    emit(PlacesSearchLoading());

    try {
      // 3 send data to PlacesRepository
      final results = await placesRepository.searchPlaces(query);
      emit(PlacesSearchLoaded(results));
      return results;
    } catch (error) {
      emit(PlacesSearchError(error.toString()));
    }
    return null;
  }
}
