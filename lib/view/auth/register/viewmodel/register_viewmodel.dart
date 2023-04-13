import 'package:cread/core/constants/app/route_names.dart';
import 'package:cread/view/auth/register/service/register_service.dart';
import 'package:cread/core/extension/string_extension.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:cread/core/base/model/base_view_model.dart';
part 'register_viewmodel.g.dart';

class RegisterViewModel = _RegisterViewModelBase with _$RegisterViewModel;

abstract class _RegisterViewModelBase with Store, BaseViewModel {
  RegisterService registerRepository;
  _RegisterViewModelBase(this.registerRepository);
  @override
  void setContext(BuildContext context) => ctx = context;
  @override
  void init() {}
  @override
  void dispose() {}

  @observable
  bool isPasswordVisible = false;
  @observable
  String email = '';
  @observable
  String password = '';
  @observable
  String passwordAgain = '';

  @observable
  bool isPasswordSame = true;
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
    firstOpen = false;
  }

  @action
  void changePassword(String password) => this.password = password;
  @action
  void changePasswordAgain(String passwordAgain) =>
      this.passwordAgain = passwordAgain;
  @action
  void setPasswordAgain(String passwordAgain) {
    if (password == passwordAgain) {
      this.passwordAgain = passwordAgain;
      isPasswordSame = true;
    } else {
      isPasswordSame = false;
    }
  }

  @action
  void setPasswordVisible() {
    isPasswordVisible = !isPasswordVisible;
  }

  @action
  Future<void> register() async {
    try {
      if (isPasswordSame) {
        await registerRepository.signUp(email: email, password: password);
        await navigation.navigateToPageClear(path: RouteName.LOGIN);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> navigateToLogin() async {
    await navigation.navigateToPageClear(path: RouteName.LOGIN);
  }
}
