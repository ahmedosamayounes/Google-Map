import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../data/model/places/place_model.dart';
import '../logic/cubit/directions/directions_cubit.dart';
import '../logic/cubit/directions/directions_state.dart';
import 'widgets/floating_search_bar.dart';
import 'widgets/route_Info_card.dart';
import '../../../core/helpers/location_helper.dart';
import '../../../core/theming/my_colors.dart';
import 'widgets/app_drawer.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  final TextEditingController searchController = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();
  final Completer<GoogleMapController> _mapController = Completer();
  Position? position;
  Marker? selectedLocationMarker;
  Set<Polyline> polylines = {};
  String? currentDistance;
  String? currentDuration;
  bool isRouteInfoVisible = false;

  Future<void> getMyCurrentLocation() async {
    position = await LocationHelper.getCurrentLocation().whenComplete(() {
      setState(() {});
    });
  }

  CameraPosition get _myCurrentLocationByCamera => CameraPosition(
    target: LatLng(position?.latitude ?? 0.0, position?.longitude ?? 0.0),
    zoom: 17,
  );

  Widget buildMap() {
    return GoogleMap(
      mapType: MapType.normal,
      myLocationEnabled: true,
      zoomControlsEnabled: false,
      myLocationButtonEnabled: false,
      initialCameraPosition: _myCurrentLocationByCamera,
      markers: selectedLocationMarker != null ? {selectedLocationMarker!} : {},
      onMapCreated: (GoogleMapController controller) {
        _mapController.complete(controller);
      },
      polylines: polylines,
    );
  }

  Future<void> _goToMyCurrentLocation() async {
    final GoogleMapController controller = await _mapController.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(_myCurrentLocationByCamera),
    );
  }

  // make the camera moved to the location who choosed
  Future<void> _goToSelectedLocation(PlaceModel place) async {
    final GoogleMapController controller = await _mapController.future;
    final LatLng targetLatLng = LatLng(place.latitude, place.longitude);

    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: targetLatLng, zoom: 15),
      ),
    );

    setState(() {
      selectedLocationMarker = Marker(
        markerId: const MarkerId('selected_place'),
        position: targetLatLng,
        infoWindow: InfoWindow(title: place.displayName),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      );
    });

    if (position != null) {
      final origin = LatLng(position!.latitude, position!.longitude);
      context.read<DirectionsCubit>().getDirections(origin, targetLatLng);
    }
  }

  @override
  void initState() {
    getMyCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),

      body: BlocListener<DirectionsCubit, DirectionsState>(
        listener: (context, state) {
          if (state is DirectionsLoaded) {
            setState(() {
              polylines.clear();
              polylines.add(
                Polyline(
                  polylineId: const PolylineId('osrm_directions_line'),
                  points: state.polylinePoints,
                  color: MyColors.primaryColor,
                  width: 5,
                  startCap: Cap.roundCap,
                  endCap: Cap.roundCap,
                ),
              );
              currentDistance = (state.distance / 1000).toStringAsFixed(1);
              currentDuration = (state.duration / 60).toStringAsFixed(0);
              isRouteInfoVisible = true;
            });
          } else if (state is DirectionsError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Failed to draw route: ${state.errorMessage}'),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: Stack(
          fit: StackFit.loose,
          children: [
            position != null
                ? buildMap()
                : const Center(
                    child: CircularProgressIndicator(
                      color: MyColors.primaryColor,
                    ),
                  ),
            FloatingSearchBar(
              searchController: searchController,
              searchFocusNode: searchFocusNode,
              // when selected place
              onPlaceSelected: (PlaceModel place) {
                searchController.text = place.displayName;
                searchFocusNode.unfocus();
                // Execute this function _goToSelectedLocation
                _goToSelectedLocation(place);
              },
              onClear: () {
                searchController.clear();
                setState(() {
                  selectedLocationMarker = null;
                  polylines.clear();
                  // close the card when clear search
                  isRouteInfoVisible = false;
                });
              },
            ),
            RouteInfoCard(
              isVisible: isRouteInfoVisible,
              distance: currentDistance,
              duration: currentDuration,
              onClose: () {
                setState(() {
                  isRouteInfoVisible = false;
                  polylines.clear();
                  selectedLocationMarker = null;
                  searchController.clear();
                });
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _goToMyCurrentLocation,
        backgroundColor: MyColors.primaryColor,
        shape: const CircleBorder(),
        child: Icon(Icons.my_location, color: Colors.white, size: 24.sp),
      ),
    );
  }
}
