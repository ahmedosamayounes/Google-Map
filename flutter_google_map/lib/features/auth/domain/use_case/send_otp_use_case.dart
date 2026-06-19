import '../repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SendOtpUseCase {
  final AuthRepository repository;

  SendOtpUseCase(this.repository);

  Future<void> call({
    required String phoneNumber,
    required void Function(String verificationId, int? resendToken) codeSent,
    required void Function(FirebaseAuthException error) verificationFailed,
    required void Function(PhoneAuthCredential credential) verificationCompleted,
    required void Function(String verificationId) codeAutoRetrievalTimeout,
  }) async {
    await repository.submitPhoneNumber(
      phoneNumber: phoneNumber,
      codeSent: codeSent,
      verificationFailed: verificationFailed,
      verificationCompleted: verificationCompleted,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }
}