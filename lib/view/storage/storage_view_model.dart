import 'dart:convert';
import 'dart:io';

import 'package:cread/core/base/model/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:path_provider/path_provider.dart';

import '../../core/constants/app/route_names.dart';
import '../library/model/book.dart';
part 'storage_view_model.g.dart';

class StorageViewModel = _StorageViewModelBase with _$StorageViewModel;

abstract class _StorageViewModelBase with Store, BaseViewModel {
  @override
  void init() {}
  Future<List<Book>> getBooksFromStorage() async {
    List<Book> books = [];
    Directory? appDocDirectory = await getExternalStorageDirectory();
    if (appDocDirectory == null) {
      return books;
    }
    final file = File(appDocDirectory.path + "/books.json");
    if (file.existsSync()) {
      String bookList = await file.readAsString();
      var bookMap = jsonDecode(bookList);
      for (var book in bookMap['books']) {
        books.add(Book.fromJson(book));
      }
      return books;
    }
    return books;
  }

  @override
  void dispose() {}

  @override
  void setContext(BuildContext context) => ctx = context;
}
