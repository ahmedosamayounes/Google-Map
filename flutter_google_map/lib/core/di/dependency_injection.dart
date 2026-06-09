import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import '../../features/auth/logic/cubit/phone_auth_cubit.dart';
import '../../features/map/data/repo/directions/directions_repository_Impl.dart';
import '../../features/map/data/repo/places/places_repository_impl.dart';
import '../../features/map/data/web_service/directions/directions_web_service.dart';
import '../../features/map/data/web_service/places/places_web_service.dart';
import '../../features/map/logic/cubit/directions/directions_cubit.dart';
import '../../features/map/logic/cubit/places/places_cubit.dart';

final getIt = GetIt.instance;

Future<void> initGetIt() async {
  // Dio & Network
  getIt.registerLazySingleton<Dio>(() => Dio());

  // Phone Auth Cubit (Single instance for all screens)
  getIt.registerLazySingleton<PhoneAuthCubit>(() => PhoneAuthCubit());

  // Places Feature
  getIt.registerLazySingleton<PlacesRemoteDataSourceImpl>(
    () => PlacesRemoteDataSourceImpl(dio: getIt<Dio>()),
  );
  getIt.registerLazySingleton<PlacesRepositoryImpl>(
    () => PlacesRepositoryImpl(
      remoteDataSource: getIt<PlacesRemoteDataSourceImpl>(),
    ),
  );
  getIt.registerFactory<PlacesCubit>(
    () => PlacesCubit(placesRepository: getIt<PlacesRepositoryImpl>()),
  );

  // Directions Feature
  getIt.registerLazySingleton<DirectionsRemoteDataSourceImpl>(
    () => DirectionsRemoteDataSourceImpl(dio: getIt<Dio>()),
  );
  getIt.registerLazySingleton<DirectionsRepositoryImpl>(
    () => DirectionsRepositoryImpl(
      remoteDataSource: getIt<DirectionsRemoteDataSourceImpl>(),
    ),
  );
  getIt.registerFactory<DirectionsCubit>(
    () => DirectionsCubit(
      directionsRepository: getIt<DirectionsRepositoryImpl>(),
    ),
  );
}
