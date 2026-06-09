part of 'phone_auth_cubit.dart';

@immutable
sealed class PhoneAuthState {}

class PhoneAuthInitial extends PhoneAuthState {}

class PhoneAuthLoading extends PhoneAuthState {}

class PhoneAuthSubmitted extends PhoneAuthState {}

class PhoneOtpVerified extends PhoneAuthState {}

class PhoneAuthError extends PhoneAuthState {
  final String errorMessage;

  PhoneAuthError({required this.errorMessage});
}
