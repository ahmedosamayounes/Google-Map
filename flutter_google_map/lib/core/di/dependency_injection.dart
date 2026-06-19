import '../../features/auth/data/repository/auth_repository_Impl.dart';
import '../../features/auth/domain/repository/auth_repository.dart';
import '../../features/auth/domain/use_case/get_logged_In_user_use_case.dart';
import '../../features/auth/domain/use_case/send_otp_use_case.dart';
import '../../features/auth/domain/use_case/sign_out_use_case.dart';
import '../../features/auth/domain/use_case/verify_otp_use_case.dart';
import '../../features/map/domain/repository/places/places_repository.dart';
import '../../features/map/domain/use_case/places/places_use_case.dart';
import '../../features/map/domain/repository/directions/directions_repository.dart';
import '../../features/map/domain/use_case/directions/directions_use_case.dart';
import '../../features/map/presentation/cubit/directions/directions_cubit.dart';
import '../../features/map/presentation/cubit/places/places_cubit.dart';

import '../../features/auth/presentation/cubit/phone_auth_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import '../../features/map/data/repo/directions/directions_repository_Impl.dart';
import '../../features/map/data/repo/places/places_repository_impl.dart';
import '../../features/map/data/web_service/directions/directions_web_service.dart';
import '../../features/map/data/web_service/places/places_web_service.dart';


final getIt = GetIt.instance;

Future<void> initGetIt() async {
  // Dio & Network
  getIt.registerLazySingleton<Dio>(() => Dio());

  // Phone Auth Cubit (Single instance for all screens)
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(),
  );
  getIt.registerLazySingleton<SendOtpUseCase>(
    () => SendOtpUseCase(getIt<AuthRepository>()),
  );
  getIt.registerLazySingleton<VerifyOtpUseCase>(
    () => VerifyOtpUseCase(getIt<AuthRepository>()),
  );
  getIt.registerLazySingleton<SignOutUseCase>(
    () => SignOutUseCase(getIt<AuthRepository>()),
  );
  getIt.registerLazySingleton<GetLoggedInUserUseCase>(
    () => GetLoggedInUserUseCase(getIt<AuthRepository>()),
  );
  getIt.registerLazySingleton<PhoneAuthCubit>(
    () => PhoneAuthCubit(
      sendOtpUseCase: getIt<SendOtpUseCase>(),
      verifyOtpUseCase: getIt<VerifyOtpUseCase>(),
      signOutUseCase: getIt<SignOutUseCase>(),
      getLoggedInUserUseCase: getIt<GetLoggedInUserUseCase>(),
    ),
  );

  // Places Feature
  getIt.registerLazySingleton<PlacesRemoteDataSourceImpl>(
    () => PlacesRemoteDataSourceImpl(dio: getIt<Dio>()),
  );
  getIt.registerLazySingleton<PlacesRepository>(
    () => PlacesRepositoryImpl(
      remoteDataSource: getIt<PlacesRemoteDataSourceImpl>(),
    ),
  );
  getIt.registerLazySingleton<SearchPlacesUseCase>(
    () => SearchPlacesUseCase(getIt<PlacesRepository>()),
  );
  getIt.registerFactory<PlacesCubit>(
    () => PlacesCubit(searchPlacesUseCase: getIt<SearchPlacesUseCase>()),
  );

  // Directions Feature
  getIt.registerLazySingleton<DirectionsRemoteDataSourceImpl>(
    () => DirectionsRemoteDataSourceImpl(dio: getIt<Dio>()),
  );
  getIt.registerLazySingleton<DirectionsRepository>(
    () => DirectionsRepositoryImpl(
      remoteDataSource: getIt<DirectionsRemoteDataSourceImpl>(),
    ),
  );
  getIt.registerLazySingleton<DirectionsUseCase>(
    () => DirectionsUseCase(getIt<DirectionsRepository>()),
  );
  getIt.registerFactory<DirectionsCubit>(
    () => DirectionsCubit(directionsUseCase: getIt<DirectionsUseCase>()),
  );
}