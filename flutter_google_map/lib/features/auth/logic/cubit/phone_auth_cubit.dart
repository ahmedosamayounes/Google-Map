// ignore_for_file: unnecessary_this

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

part 'phone_auth_state.dart';

class PhoneAuthCubit extends Cubit<PhoneAuthState> {
  late String verificationId;
  GlobalKey<FormState> phoneFormKey = GlobalKey();
  final TextEditingController phoneController = TextEditingController();
  final PinInputController otpController = PinInputController();
  PhoneAuthCubit() : super(PhoneAuthInitial());

  Future<void> submitPhoneNumber() async {
    emit(PhoneAuthLoading());
    String phoneNumber = phoneController.text.trim();
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+2$phoneNumber',
      timeout: const Duration(seconds: 15),
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
    // Phone Number
  }

  void codeSent(String verificationId, int? resendToken) {
    this.verificationId = verificationId;
    emit(PhoneAuthSubmitted());
  }
  // Phone Number  + verificationId

  Future<void> submitOtp(String otp) async {
    emit(PhoneAuthLoading());

    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: this.verificationId,
      smsCode: otp,
    );
    await signIn(credential);
  }
  // Phone Number  + verificationId + otp  inside credential

  void verificationCompleted(PhoneAuthCredential credential) async {
    await signIn(credential);
  }
  // when firebase can auto verify the otp without click on submit button

  void verificationFailed(FirebaseAuthException error) {
    emit(PhoneAuthError(errorMessage: error.toString()));
  }

  void codeAutoRetrievalTimeout(String verificationId) {}

  Future<void> signIn(PhoneAuthCredential credential) async {
    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
      emit(PhoneOtpVerified());
    } catch (e) {
      emit(PhoneAuthError(errorMessage: e.toString()));
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  User getLoggedIUser() {
    User firebaseUser = FirebaseAuth.instance.currentUser!;
    return firebaseUser;
  }
}
