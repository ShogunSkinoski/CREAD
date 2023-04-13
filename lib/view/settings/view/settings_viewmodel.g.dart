// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SettingViewModel on _SettingViewModelBase, Store {
  late final _$isDarkModeAtom =
      Atom(name: '_SettingViewModelBase.isDarkMode', context: context);

  @override
  bool get isDarkMode {
    _$isDarkModeAtom.reportRead();
    return super.isDarkMode;
  }

  @override
  set isDarkMode(bool value) {
    _$isDarkModeAtom.reportWrite(value, super.isDarkMode, () {
      super.isDarkMode = value;
    });
  }

  late final _$SelectedLanguageAtom =
      Atom(name: '_SettingViewModelBase.SelectedLanguage', context: context);

  @override
  String? get SelectedLanguage {
    _$SelectedLanguageAtom.reportRead();
    return super.SelectedLanguage;
  }

  @override
  set SelectedLanguage(String? value) {
    _$SelectedLanguageAtom.reportWrite(value, super.SelectedLanguage, () {
      super.SelectedLanguage = value;
    });
  }

  late final _$_SettingViewModelBaseActionController =
      ActionController(name: '_SettingViewModelBase', context: context);

  @override
  void changeLanguage(String? language) {
    final _$actionInfo = _$_SettingViewModelBaseActionController.startAction(
        name: '_SettingViewModelBase.changeLanguage');
    try {
      return super.changeLanguage(language);
    } finally {
      _$_SettingViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeTheme() {
    final _$actionInfo = _$_SettingViewModelBaseActionController.startAction(
        name: '_SettingViewModelBase.changeTheme');
    try {
      return super.changeTheme();
    } finally {
      _$_SettingViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isDarkMode: ${isDarkMode},
SelectedLanguage: ${SelectedLanguage}
    ''';
  }
}
