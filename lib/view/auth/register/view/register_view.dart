import 'package:cread/feature/widget/TextField/custom_textfield.dart';
import 'package:cread/view/auth/register/viewmodel/register_viewmodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/init/firebase/auth_repository.dart';
import '../service/register_service.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  RegisterViewModel viewModel = RegisterViewModel(
      RegisterService(AuthRepository(firebaseAuth: FirebaseAuth.instance)));
  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: viewModel,
      onModelReady: (viewModel) {
        viewModel.setContext(context);
        viewModel.init();
      },
      builder: (context, viewModel) => buildScaffold(),
    );
  }

  Widget buildScaffold() {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 197, 225, 248),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: buildBody());
  }

  Widget buildBody() {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: const Color.fromARGB(255, 197, 225, 248),
      child: Column(children: [
        const Spacer(),
        const Icon(
          Icons.person_add,
          size: 100,
          color: Colors.white,
        ),
        const Spacer(),
        Expanded(
          flex: 16,
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
            ),
            child: Center(child: SingleChildScrollView(child: buildForm())),
          ),
        ),
      ]),
    );
  }

  Padding buildForm() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: buildEmailField(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: buildPasswordField(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: buildPasswordAgainField(),
          ),
          buildRegisterButton(),
        ],
      ),
    );
  }

  SizedBox buildEmailField() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Observer(builder: (_) {
        return EmailTextField(
            onChanged: viewModel.changeEmail, emailError: viewModel.emailError);
      }),
    );
  }

  SizedBox buildPasswordField() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Observer(builder: (_) {
        return PasswordTextField(
            onChanged: viewModel.changePassword,
            onPressed: viewModel.setPasswordVisible,
            obscureText: viewModel.isPasswordVisible);
      }),
    );
  }

  SizedBox buildPasswordAgainField() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Observer(builder: (_) {
        return PasswordTextField(
            onChanged: viewModel.setPasswordAgain,
            onPressed: viewModel.setPasswordVisible,
            obscureText: viewModel.isPasswordVisible);
      }),
    );
  }

  Observer buildRegisterButton() {
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
            viewModel.register();
          },
          child: const Text(
            'Register',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      );
    });
  }
}
