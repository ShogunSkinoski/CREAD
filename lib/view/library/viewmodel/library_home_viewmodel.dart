import 'package:cread/core/base/model/base_view_model.dart';
import 'package:cread/core/init/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../core/constants/app/route_names.dart';
import '../model/book.dart';
import '../service/lib_repo.dart';
part 'library_home_viewmodel.g.dart';

class LibraryHomeViewModel = _LibraryHomeViewModelBase
    with _$LibraryHomeViewModel;

abstract class _LibraryHomeViewModelBase with Store, BaseViewModel {
  @observable
  String searchString = "";
  Future<List<Book>> getBooks() async {
    if (searchString.isEmpty) return Future.value([]);
    return await BookRepo().getBooks(searchString);
  }

  void navigateToBookDetails(Book book) {
    Navigator.pushNamed(ctx, RouteName.BOOK, arguments: book);
  }

  @action
  setSearchString(String value) => searchString = value;

  @override
  void setContext(BuildContext context) {
    ctx = context;
  }

  @override
  void init() {
    getBooks();
  }

  @override
  void dispose() {}
}
