import '../repository/auth_repository.dart';

class VerifyOtpUseCase {
  final AuthRepository repository;

  VerifyOtpUseCase(this.repository);

  Future<void> call({required String verificationId, required String smsCode}) async {
    await repository.submitOtp(verificationId: verificationId, smsCode: smsCode);
  }
}