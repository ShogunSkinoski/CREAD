// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ReviewViewModel on _ReviewViewModelBase, Store {
  late final _$reviewAtom =
      Atom(name: '_ReviewViewModelBase.review', context: context);

  @override
  String get review {
    _$reviewAtom.reportRead();
    return super.review;
  }

  @override
  set review(String value) {
    _$reviewAtom.reportWrite(value, super.review, () {
      super.review = value;
    });
  }

  late final _$_ReviewViewModelBaseActionController =
      ActionController(name: '_ReviewViewModelBase', context: context);

  @override
  void setReview(String value) {
    final _$actionInfo = _$_ReviewViewModelBaseActionController.startAction(
        name: '_ReviewViewModelBase.setReview');
    try {
      return super.setReview(value);
    } finally {
      _$_ReviewViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
review: ${review}
    ''';
  }
}
