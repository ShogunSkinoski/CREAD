// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegisterViewModel on _RegisterViewModelBase, Store {
  late final _$emailAtom =
      Atom(name: '_RegisterViewModelBase.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_RegisterViewModelBase.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$passwordAgainAtom =
      Atom(name: '_RegisterViewModelBase.passwordAgain', context: context);

  @override
  String get passwordAgain {
    _$passwordAgainAtom.reportRead();
    return super.passwordAgain;
  }

  @override
  set passwordAgain(String value) {
    _$passwordAgainAtom.reportWrite(value, super.passwordAgain, () {
      super.passwordAgain = value;
    });
  }

  late final _$isPasswordSameAtom =
      Atom(name: '_RegisterViewModelBase.isPasswordSame', context: context);

  @override
  bool get isPasswordSame {
    _$isPasswordSameAtom.reportRead();
    return super.isPasswordSame;
  }

  @override
  set isPasswordSame(bool value) {
    _$isPasswordSameAtom.reportWrite(value, super.isPasswordSame, () {
      super.isPasswordSame = value;
    });
  }

  late final _$registerAsyncAction =
      AsyncAction('_RegisterViewModelBase.register', context: context);

  @override
  Future<void> register() {
    return _$registerAsyncAction.run(() => super.register());
  }

  late final _$_RegisterViewModelBaseActionController =
      ActionController(name: '_RegisterViewModelBase', context: context);

  @override
  void changeEmail(String email) {
    final _$actionInfo = _$_RegisterViewModelBaseActionController.startAction(
        name: '_RegisterViewModelBase.changeEmail');
    try {
      return super.changeEmail(email);
    } finally {
      _$_RegisterViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changePassword(String password) {
    final _$actionInfo = _$_RegisterViewModelBaseActionController.startAction(
        name: '_RegisterViewModelBase.changePassword');
    try {
      return super.changePassword(password);
    } finally {
      _$_RegisterViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPasswordAgain(String passwordAgain) {
    final _$actionInfo = _$_RegisterViewModelBaseActionController.startAction(
        name: '_RegisterViewModelBase.setPasswordAgain');
    try {
      return super.setPasswordAgain(passwordAgain);
    } finally {
      _$_RegisterViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
password: ${password},
passwordAgain: ${passwordAgain},
isPasswordSame: ${isPasswordSame}
    ''';
  }
}
