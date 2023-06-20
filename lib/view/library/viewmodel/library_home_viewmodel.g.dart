// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'library_home_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LibraryHomeViewModel on _LibraryHomeViewModelBase, Store {
  late final _$searchStringAtom =
      Atom(name: '_LibraryHomeViewModelBase.searchString', context: context);

  @override
  String get searchString {
    _$searchStringAtom.reportRead();
    return super.searchString;
  }

  @override
  set searchString(String value) {
    _$searchStringAtom.reportWrite(value, super.searchString, () {
      super.searchString = value;
    });
  }

  late final _$_LibraryHomeViewModelBaseActionController =
      ActionController(name: '_LibraryHomeViewModelBase', context: context);

  @override
  dynamic setSearchString(String value) {
    final _$actionInfo = _$_LibraryHomeViewModelBaseActionController
        .startAction(name: '_LibraryHomeViewModelBase.setSearchString');
    try {
      return super.setSearchString(value);
    } finally {
      _$_LibraryHomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
searchString: ${searchString}
    ''';
  }
}
