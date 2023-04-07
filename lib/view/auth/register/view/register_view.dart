import 'package:cread/view/auth/register/viewmodel/register_viewmodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(appBar: AppBar(), body: buildBody());
  }

  Widget buildBody() {
    return Column(children: [
      buildEmailField(),
      buildPasswordField(),
      buildPasswordAgainField(),
      buildRegisterButton(),
    ]);
  }

  TextField buildEmailField() {
    return TextField(onChanged: (value) => viewModel.changeEmail(value));
  }

  TextField buildPasswordField() {
    return TextField(onChanged: (value) => viewModel.changePassword(value));
  }

  TextField buildPasswordAgainField() {
    return TextField(onChanged: (value) => viewModel.setPasswordAgain(value));
  }

  ElevatedButton buildRegisterButton() {
    return ElevatedButton(
        onPressed: () => viewModel.register(), child: const Text('Register'));
  }
}
