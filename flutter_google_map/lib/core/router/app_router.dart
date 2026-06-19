import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/map/presentation/cubit/directions/directions_cubit.dart';
import '../../features/map/presentation/cubit/places/places_cubit.dart';
import '../../features/map/presentation/screens/map_screen.dart';
import '../../features/onboarding/presentation/screens/onboarding_screen.dart';
import '../../features/auth/presentation/cubit/phone_auth_cubit.dart';
import '../../features/auth/presentation/screens/otp_auth/otp_auth.dart';
import '../../features/auth/presentation/screens/phone_auth/phone_auth.dart';
import 'routes_string.dart';
import '../../core/di/dependency_injection.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case phoneScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: getIt<PhoneAuthCubit>(),
            child: PhoneAuth(),
          ),
        );
      case otpScreen:
        final phoneNumber = settings.arguments as String;

        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: getIt<PhoneAuthCubit>(),
            child: OtpAuth(phoneNumber: phoneNumber),
          ),
        );

      case mapScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider.value(value: getIt<PhoneAuthCubit>()),
              BlocProvider<PlacesCubit>(
                //app router make cubit create Instance from PlacesRepositoryImpl and put it inside PlacesRepository
                create: (context) => getIt<PlacesCubit>(),
              ),
              BlocProvider<DirectionsCubit>(
                create: (context) => getIt<DirectionsCubit>(),
              ),
            ],
            child: const MapScreen(),
          ),
        );

      case onboardingScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: getIt<PhoneAuthCubit>(),
            child: const OnboardingScreen(),
          ),
        );

      default:
        return null;
    }
  }
}
