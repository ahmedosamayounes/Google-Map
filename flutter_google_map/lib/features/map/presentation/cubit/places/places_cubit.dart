import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/places/place_entity.dart';
import '../../../domain/use_case/places/places_use_case.dart';
import 'places_state.dart';

class PlacesCubit extends Cubit<PlacesState> {
  final SearchPlacesUseCase _searchPlacesUseCase;
  PlacesCubit({required SearchPlacesUseCase searchPlacesUseCase})
    : _searchPlacesUseCase = searchPlacesUseCase,
      super(
        PlacesInitial(),
      ); // 2  data inside query , came from ui (suggestionsCallback)
  Future<List<PlaceEntity>?> searchPlaces(String query) async {
    if (query.isEmpty) {
      emit(PlacesInitial());
      return [];
    }

    emit(PlacesSearchLoading());

    try {
      // 3 send data to _searchPlacesUseCase
      final results = await _searchPlacesUseCase(query);
      emit(PlacesSearchLoaded(results));
      return results;
    } catch (error) {
      emit(PlacesSearchError(error.toString()));
    }
    return null;
  }
}
