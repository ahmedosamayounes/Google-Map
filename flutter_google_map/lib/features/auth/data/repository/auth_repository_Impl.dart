import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<void> submitPhoneNumber({
    required String phoneNumber,
    required void Function(String verificationId, int? resendToken) codeSent,
    required void Function(FirebaseAuthException error) verificationFailed,
    required void Function(PhoneAuthCredential credential) verificationCompleted,
    required void Function(String verificationId) codeAutoRetrievalTimeout,
  }) async {
    await _firebaseAuth.verifyPhoneNumber(
      phoneNumber: '+2$phoneNumber',
      timeout: const Duration(seconds: 15),
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }

  @override
  Future<void> submitOtp({
    required String verificationId,
    required String smsCode,
  }) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsCode,
    );
    await _firebaseAuth.signInWithCredential(credential);
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  @override
  User? getLoggedInUser() {
    return _firebaseAuth.currentUser;
  }
}
