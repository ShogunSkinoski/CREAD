import 'package:cread/view/auth/register/service/register_service.dart';
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
  String email = '';
  @observable
  String password = '';
  @observable
  String passwordAgain = '';

  @observable
  bool isPasswordSame = true;

  @action
  void changeEmail(String email) => this.email = email;
  @action
  void changePassword(String password) => this.password = password;
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
  Future<void> register() async {
    if (isPasswordSame) {
      await registerRepository.signUp(email: email, password: password);
    }
  }
}
