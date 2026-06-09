import 'package:dio/dio.dart';
import 'package:flutter_google_map/core/router/routes_string.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../model/directions/directions_model.dart';

abstract class DirectionsRemoteDataSource {
  Future<DirectionsModel> getDirections(LatLng origin, LatLng destination);
}

class DirectionsRemoteDataSourceImpl implements DirectionsRemoteDataSource {
  final Dio dio;

  DirectionsRemoteDataSourceImpl({required this.dio});

  @override
  Future<DirectionsModel> getDirections(
    LatLng origin,
    LatLng destination,
  ) async {
    // call the url and you have to give him origin and destination (longitude , latitude)
    // Path Parameters
    final String url =
        '$dierctionsMap${origin.longitude},${origin.latitude};${destination.longitude},${destination.latitude}';

    try {
      final response = await dio.get(
        url,
        queryParameters: {
          'overview': 'full',
          'geometries': 'polyline',
          //flutter_polyline_points
        },
      );

      if (response.statusCode == 200) {
        return DirectionsModel.fromJson(response.data);
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
        );
      }
    } on DioException catch (e) {
      throw Exception(
        e.message ?? 'Failed to fetch directions from OSRM server.',
      );
    } catch (e) {
      throw Exception('An unexpected error occurred: $e');
    }
  }
}
