// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProfileViewModel on _ProfileViewModelBase, Store {
  late final _$displayNameAtom =
      Atom(name: '_ProfileViewModelBase.displayName', context: context);

  @override
  String get displayName {
    _$displayNameAtom.reportRead();
    return super.displayName;
  }

  @override
  set displayName(String value) {
    _$displayNameAtom.reportWrite(value, super.displayName, () {
      super.displayName = value;
    });
  }

  late final _$userAtom =
      Atom(name: '_ProfileViewModelBase.user', context: context);

  @override
  User get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$changeNameAsyncAction =
      AsyncAction('_ProfileViewModelBase.changeName', context: context);

  @override
  Future<void> changeName(String name) {
    return _$changeNameAsyncAction.run(() => super.changeName(name));
  }

  @override
  String toString() {
    return '''
displayName: ${displayName},
user: ${user}
    ''';
  }
}
