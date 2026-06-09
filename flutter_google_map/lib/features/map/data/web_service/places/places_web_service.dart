import 'package:dio/dio.dart';
import '../../../../../core/router/routes_string.dart';
import '../../model/places/place_model.dart';

abstract class PlacesRemoteDataSource {
  Future<List<PlaceModel>> searchPlaces(String query);
}

class PlacesRemoteDataSourceImpl implements PlacesRemoteDataSource {
  final Dio dio;

  PlacesRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<PlaceModel>> searchPlaces(String query) async {
    // 7 call the url (internet)
    const String url = openStreetMapApiSearch;
    // dio take the url and give him queryParameters
    // so link become like that https://nominatim.openstreetmap.org/search?q=القاهرة&format=json&limit=5&addressdetails=1
    try {
      final response = await dio.get(
        url,
        queryParameters: {
          'q': query,
          'format': 'json',
          'limit': 5,
          'addressdetails': 1,
        },
        // give to the server User-Agent to give him save and make request
        options: Options(headers: {'User-Agent': 'my_flutter_maps_app'}),
      );

      // if data came from server success
      if (response.statusCode == 200) {
        // dio convert Automatic JSON Decoding from internet (raw data) to List dart can understand
        final List responseData = response.data;
        // (map) is loop inside the big list
        // take the element (raw) and give it to PlaceModel factory
        // PlaceModel change the element (raw) to Object and put it in clean list to return to PlacesRepositoryImpl
        return responseData.map((item) => PlaceModel.fromJson(item)).toList();
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
        );
      }
    } on DioException catch (e) {
      throw Exception(e.message ?? 'error from internet');
    } catch (e) {
      throw Exception('unexpected error :  $e');
    }
  }
}
