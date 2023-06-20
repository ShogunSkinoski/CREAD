// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_details_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BookDetailsViewModel on _BookDetailsViewModelBase, Store {
  late final _$buttonNameAtom =
      Atom(name: '_BookDetailsViewModelBase.buttonName', context: context);

  @override
  String get buttonName {
    _$buttonNameAtom.reportRead();
    return super.buttonName;
  }

  @override
  set buttonName(String value) {
    _$buttonNameAtom.reportWrite(value, super.buttonName, () {
      super.buttonName = value;
    });
  }

  late final _$inStorgaeAtom =
      Atom(name: '_BookDetailsViewModelBase.inStorgae', context: context);

  @override
  bool get inStorgae {
    _$inStorgaeAtom.reportRead();
    return super.inStorgae;
  }

  @override
  set inStorgae(bool value) {
    _$inStorgaeAtom.reportWrite(value, super.inStorgae, () {
      super.inStorgae = value;
    });
  }

  late final _$isFavoriteAtom =
      Atom(name: '_BookDetailsViewModelBase.isFavorite', context: context);

  @override
  bool get isFavorite {
    _$isFavoriteAtom.reportRead();
    return super.isFavorite;
  }

  @override
  set isFavorite(bool value) {
    _$isFavoriteAtom.reportWrite(value, super.isFavorite, () {
      super.isFavorite = value;
    });
  }

  late final _$downloadProcAtom =
      Atom(name: '_BookDetailsViewModelBase.downloadProc', context: context);

  @override
  int get downloadProc {
    _$downloadProcAtom.reportRead();
    return super.downloadProc;
  }

  @override
  set downloadProc(int value) {
    _$downloadProcAtom.reportWrite(value, super.downloadProc, () {
      super.downloadProc = value;
    });
  }

  late final _$readBookAsyncAction =
      AsyncAction('_BookDetailsViewModelBase.readBook', context: context);

  @override
  Future<void> readBook() {
    return _$readBookAsyncAction.run(() => super.readBook());
  }

  @override
  String toString() {
    return '''
buttonName: ${buttonName},
inStorgae: ${inStorgae},
isFavorite: ${isFavorite},
downloadProc: ${downloadProc}
    ''';
  }
}
