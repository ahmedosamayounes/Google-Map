import '../../../data/model/places/place_model.dart';

abstract class PlacesState {}

class PlacesInitial extends PlacesState {}

class PlacesSearchLoading extends PlacesState {}

class PlacesSearchLoaded extends PlacesState {
  final List<PlaceModel> places;
  PlacesSearchLoaded(this.places);
}

class PlacesSearchError extends PlacesState {
  final String errorMessage;
  PlacesSearchError(this.errorMessage);
}
