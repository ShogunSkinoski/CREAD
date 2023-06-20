import 'package:cread/core/init/firebase/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class ILoginService {
  ILoginService(this.authRepository);
  IAuthRepository authRepository;

  Future<User?> signInWithCredentials(String email, String password);
  Future<String> signUp({required String email, required String password});
  Future<Future<List<void>>> signOut();
  Future<bool> isSignedIn();
}

class LoginService extends ILoginService {
  LoginService(super.authRepository);


 
  @override
  Future<User?> signInWithCredentials(String email, String password) async {
    return await authRepository.signInWithCredentials(email, password);
  }

  @override
  Future<String> signUp(
      {required String email, required String password}) async {
    return await authRepository.signUp(email: email, password: password);
  }

  @override
  Future<Future<List<void>>> signOut() async {
    return await authRepository.signOut();
  }

  @override
  Future<bool> isSignedIn() async {
    return await authRepository.isSignedIn();
  }
}
