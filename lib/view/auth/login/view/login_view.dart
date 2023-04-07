// ignore_for_file: prefer_const_constructors

import 'package:cread/view/auth/login/service/login_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cread/view/auth/login/viewmodel/login_view_model.dart';
import 'package:cread/core/base/view/base_view.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/init/firebase/auth_repository.dart';

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
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Column(
      children: [
        Expanded(child: buildForm()),
        buildLoginButton(),
      ],
    );
  }

  Widget buildForm() {
    return Form(
      child: Column(
        children: [
          Expanded(child: Container()),
          Expanded(
              flex: 2,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    buildEmailField(),
                    buildPasswordField(),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget buildEmailField() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: MediaQuery.of(context).size.width * 0.8,
      child: Observer(builder: (_) {
        return TextFormField(
          onChanged: (value) {
            viewModel.changeEmail(value);
          },
          decoration: InputDecoration(
            errorText: viewModel.emailError(),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            labelText: 'Email',
          ),
        );
      }),
    );
  }

  Widget buildPasswordField() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: MediaQuery.of(context).size.width * 0.8,
      child: Observer(builder: (_) {
        return TextFormField(
          obscureText: viewModel.isPasswordVisible,
          onChanged: (value) {
            viewModel.setPassword(value);
          },
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(viewModel.isPasswordVisible
                  ? Icons.visibility
                  : Icons.visibility_off),
              onPressed: () {
                viewModel.changePasswordVisibility();
              },
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            labelText: 'Password',
          ),
        );
      }),
    );
  }

  Widget buildLoginButton() {
    return Observer(builder: (_) {
      return ElevatedButton(
        onPressed: () {
          viewModel.login();
        },
        child: Text('Login'),
      );
    });
  }
}
