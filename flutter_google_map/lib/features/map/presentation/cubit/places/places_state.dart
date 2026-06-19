import '../../../domain/entities/places/place_entity.dart';

abstract class PlacesState {}

class PlacesInitial extends PlacesState {}

class PlacesSearchLoading extends PlacesState {}

class PlacesSearchLoaded extends PlacesState {
  final List<PlaceEntity> places;
  PlacesSearchLoaded(this.places);
}

class PlacesSearchError extends PlacesState {
  final String errorMessage;
  PlacesSearchError(this.errorMessage);
}
