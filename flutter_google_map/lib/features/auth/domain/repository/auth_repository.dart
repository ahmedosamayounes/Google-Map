import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<void> submitPhoneNumber({
    required String phoneNumber,
    required void Function(String verificationId, int? resendToken) codeSent,
    required void Function(FirebaseAuthException error) verificationFailed,
    required void Function(PhoneAuthCredential credential) verificationCompleted,
    required void Function(String verificationId) codeAutoRetrievalTimeout,
  });
  Future<void> submitOtp({required String verificationId, required String smsCode});
  Future<void> signOut();
  User? getLoggedInUser();
}