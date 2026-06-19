import 'package:firebase_auth/firebase_auth.dart';

import '../repository/auth_repository.dart';

class GetLoggedInUserUseCase {
  final AuthRepository repository;

  GetLoggedInUserUseCase(this.repository);

  User? call() {
    return repository.getLoggedInUser();
  }
}