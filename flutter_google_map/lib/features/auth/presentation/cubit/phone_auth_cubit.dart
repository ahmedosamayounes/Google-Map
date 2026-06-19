import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../domain/use_case/get_logged_In_user_use_case.dart';
import '../../domain/use_case/send_otp_use_case.dart';
import '../../domain/use_case/sign_out_use_case.dart';
import '../../domain/use_case/verify_otp_use_case.dart';

part 'phone_auth_state.dart';

class PhoneAuthCubit extends Cubit<PhoneAuthState> {
  final SendOtpUseCase _sendOtpUseCase;
  final VerifyOtpUseCase _verifyOtpUseCase;
  final SignOutUseCase _signOutUseCase;
  final GetLoggedInUserUseCase _getLoggedInUserUseCase;

  late String verificationId;
  final GlobalKey<FormState> phoneFormKey = GlobalKey();
  final TextEditingController phoneController = TextEditingController();
  final PinInputController otpController = PinInputController();

  PhoneAuthCubit({
    required SendOtpUseCase sendOtpUseCase,
    required VerifyOtpUseCase verifyOtpUseCase,
    required SignOutUseCase signOutUseCase,
    required GetLoggedInUserUseCase getLoggedInUserUseCase,
  }) : _sendOtpUseCase = sendOtpUseCase,
       _verifyOtpUseCase = verifyOtpUseCase,
       _signOutUseCase = signOutUseCase,
       _getLoggedInUserUseCase = getLoggedInUserUseCase,
       super(PhoneAuthInitial());

  Future<void> submitPhoneNumber() async {
    emit(PhoneAuthLoading());
    try {
      await _sendOtpUseCase(
        phoneNumber: phoneController.text.trim(),
        codeSent: _codeSent,
        verificationFailed: _verificationFailed,
        verificationCompleted: _verificationCompleted,
        codeAutoRetrievalTimeout: _codeAutoRetrievalTimeout,
      );
    } catch (e) {
      emit(PhoneAuthError(errorMessage: e.toString()));
    }
  }

  void _codeSent(String verificationId, int? resendToken) {
    this.verificationId = verificationId;
    emit(PhoneAuthSubmitted());
  }

  void _verificationCompleted(PhoneAuthCredential credential) async {
    try {
      await _verifyOtpUseCase(
        verificationId: credential.verificationId ?? this.verificationId,
        smsCode: credential.smsCode ?? '',
      );
      emit(PhoneOtpVerified());
    } catch (e) {
      emit(PhoneAuthError(errorMessage: e.toString()));
    }
  }

  void _verificationFailed(FirebaseAuthException error) {
    emit(PhoneAuthError(errorMessage: error.toString()));
  }

  void _codeAutoRetrievalTimeout(String verificationId) {}

  Future<void> submitOtp(String otp) async {
    emit(PhoneAuthLoading());
    try {
      await _verifyOtpUseCase(verificationId: verificationId, smsCode: otp);
      emit(PhoneOtpVerified());
    } catch (e) {
      emit(PhoneAuthError(errorMessage: e.toString()));
    }
  }

  Future<void> signOut() async {
    try {
      await _signOutUseCase();
    } catch (e) {
      emit(PhoneAuthError(errorMessage: e.toString()));
    }
  }

  User? getLoggedInUser() {
    return _getLoggedInUserUseCase();
  }
}
