import 'package:cread/core/extension/string_extension.dart';
import 'package:cread/feature/model/userprofile_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:cread/view/auth/login/service/login_service.dart';
import '../../../../core/base/model/base_view_model.dart';
import '../../../../core/constants/app/route_names.dart';
import '../../../../core/init/navigation/navigation.dart';
part 'login_view_model.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store, BaseViewModel {
  LoginService _loginService;
  _LoginViewModelBase(this._loginService) {}
  @observable
  String email = '';
  @observable
  bool validEmail = true;
  @observable
  String password = '';
  @observable
  bool isPasswordVisible = true;
  @observable
  bool isRememberMe = false;

  bool firstOpen = true;
  @action
  String? emailError() {
    if (email.isEmpty && firstOpen == false) {
      return 'Email is required';
    } else if (!email.isValidEmail() && firstOpen == false) {
      return 'Email is not valid';
    } else {
      return null;
    }
  }

  @action
  void changeEmail(String email) {
    this.email = email;
    emailError();
    firstOpen = false;
  }

  @action
  void setPassword(String value) => password = value;
  @action
  void changePasswordVisibility() => isPasswordVisible = !isPasswordVisible;
  @action
  void setRememberMe() => isRememberMe = !isRememberMe;
  @action
  Future<void> login() async {
    try {
      if (emailError() == null && password.isNotEmpty) {
        final user = await _loginService.signInWithCredentials(email, password);
        if (user != null) {
          UserProfile.EMAIL = email;
          navigateToHomePage();
        }
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "Wrong password provided for that user.") {
        //showSnackBar("Wrong password provided for that user.");
      } else if (e.code == "Wrong email provided for that user.") {
        //showSnackBar("Wrong email provided for that user.");
      }
    }
  }

  @override
  void init() {}

  @override
  void dispose() {}
  @override
  void setContext(BuildContext context) {
    ctx = context;
  }

  void navigateToHomePage() {
    NavigationService.instance.navigateToPageClear(path: RouteName.HOME);
  }

  void navigateToRegisterPage() {
    NavigationService.instance.navigateToPage(path: RouteName.REGISTER);
  }
}
