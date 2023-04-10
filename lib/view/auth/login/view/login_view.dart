// ignore_for_file: prefer_const_constructors

import 'package:cread/view/auth/login/service/login_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:cread/view/auth/login/viewmodel/login_view_model.dart';
import 'package:cread/core/base/view/base_view.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/init/firebase/auth_repository.dart';
import '../../../../feature/widget/TextField/custom_textfield.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginViewModel viewModel = LoginViewModel(
      LoginService(AuthRepository(firebaseAuth: FirebaseAuth.instance)));

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: viewModel,
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      builder: (context, model) => buildScaffold(),
    );
  }

  Widget buildScaffold() {
    return Scaffold(
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 197, 225, 248),
      ),
      child: Column(
        children: [
          Expanded(child: Container()),
          Expanded(flex: 2, child: buildForm()),
        ],
      ),
    );
  }

  Form buildForm() {
    return Form(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        child: Column(
          children: [
            Expanded(child: Container()),
            Expanded(
              flex: 4,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    buildEmailField(),
                    buildPasswordField(),
                    buildLoginButton(),
                    buildRegisterButton(),
                  ],
                ),
              ),
            ),
            //do account text as blue color
          ],
        ),
      ),
    );
  }

  Container buildEmailField() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: MediaQuery.of(context).size.width * 0.8,
      child: Observer(builder: (_) {
        return EmailTextField(
          onChanged: viewModel.changeEmail,
          emailError: viewModel.emailError,
        );
      }),
    );
  }

  Container buildPasswordField() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: MediaQuery.of(context).size.width * 0.8,
      child: Observer(builder: (_) {
        return PasswordTextField(
            onChanged: viewModel.setPassword,
            onPressed: viewModel.changePasswordVisibility,
            obscureText: viewModel.isPasswordVisible);
      }),
    );
  }

  Observer buildLoginButton() {
    return Observer(builder: (_) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        width: MediaQuery.of(context).size.width * 0.8,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue),
            alignment: Alignment.center,
            elevation: MaterialStateProperty.all(10),
          ),
          onPressed: () {
            viewModel.login();
          },
          child: Text(
            'Login',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      );
    });
  }

  Padding buildRegisterButton() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: RichText(
          text: TextSpan(children: [
        TextSpan(
          text: 'Don\'t have an account? ',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        TextSpan(
            text: 'Register',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 18,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                viewModel.navigateToRegisterPage();
              }),
      ])),
    );
  }
}
