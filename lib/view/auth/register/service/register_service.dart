import 'package:cread/core/init/firebase/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class IRegisterService {
  IRegisterService(this.authRepository);
  IAuthRepository authRepository;

  Future<String> signUp({required String email, required String password});
}

class RegisterService extends IRegisterService {
  RegisterService(super.authRepository);

  @override
  Future<String> signUp(
      {required String email, required String password}) async {
    return await authRepository.signUp(email: email, password: password);
  }
}
