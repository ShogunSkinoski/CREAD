import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cread/core/base/model/base_view_model.dart';
import 'package:cread/core/extension/context_extension.dart';
import 'package:cread/view/book/view/book_read.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:cread/core/init/network/network_service.dart';
import '../../../core/init/firebase/firestore_repository.dart';
import '../../library/model/book.dart';
part 'book_details_viewmodel.g.dart';

class BookDetailsViewModel = _BookDetailsViewModelBase
    with _$BookDetailsViewModel;

abstract class _BookDetailsViewModelBase with Store, BaseViewModel {
  FireStoreRepository fireStoreRepository = FireStoreRepository();

  String coverurl = '';
  @observable
  String buttonName = 'download';
  @observable
  bool inStorgae = false;
  @observable
  bool isFavorite = false;
  @observable
  int downloadProc = 0;
  Book book = Book();
  @override
  void init() async {
    requestPermission();
    Directory? appDocDir = await getExternalStorageDirectory();
    if (appDocDir == null) {
      return;
    }
    searchBookInDir(appDocDir, book.title!);
    await inFavorite();
  }

  @override
  void dispose() {}
  @override
  void setContext(BuildContext context) => ctx = context;
  @action
  Future<void> readBook() async {
    Directory? appDocDir = await getExternalStorageDirectory();
    // search book in appDocDir
    if (appDocDir == null) {
      return;
    }
    String bookPath = await searchBookInDir(appDocDir, book.title!);
    if (inStorgae) {
      _pushToRead(bookPath);
    } else {
      // download book from server
      print("https://cloudflare-ipfs.com/ipfs/${book.ipfsCid}");
      var response = await Dio().download(
          "https://cloudflare-ipfs.com/ipfs/${book.ipfsCid}", bookPath,
          onReceiveProgress: (rec, total) {
        downloadProc = ((rec / total) * 100).toInt();
      });
      inStorgae = true;
      List<Book> bookList = await _readBookMap(appDocDir);
      bookList.add(book);
      _writeBookMap(appDocDir, bookList);
    }
  }

  Future<void> _writeBookMap(Directory appDocDir, bookList) async {
    final file = File(appDocDir.path + '/' + 'books.json');
    Map<String, dynamic> booksMap = {'books': bookList};
    String jsonStr = jsonEncode(booksMap);
    file.writeAsString(jsonStr);
  }

  Future<List<Book>> _readBookMap(Directory appDocDir) async {
    List<Book> books = [];
    final file = File(appDocDir.path + '/' + 'books.json');
    if (file.existsSync()) {
      String contents = await file.readAsString();
      Map<String, dynamic> booksMap = jsonDecode(contents);
      for (var book in booksMap['books']) {
        books.add(Book.fromJson(book));
      }
      return books;
    } else {
      file.createSync(recursive: true);
      return [];
    }
  }

  Future<String> searchBookInDir(Directory appDocDir, String bookName) async {
    String bookPath = appDocDir.path + '/' + bookName;
    var files = <FileSystemEntity>[];
    var completer = Completer<List<FileSystemEntity>>();
    var lister = appDocDir.list(recursive: true);
    lister.listen((file) => files.add(file),
        onDone: () => completer.complete(files));
    var fileList = await completer.future;
    for (var f in fileList) {
      if (f.path == bookPath) {
        inStorgae = true;
        break;
      }
    }
    return bookPath;
  }

  Future<void> addToFavorite() async {
    User? user = FirebaseAuth.instance.currentUser!;
    isFavorite = !isFavorite;
    if (isFavorite) {
      await fireStoreRepository.instance
          .collection('users')
          .doc(user.uid)
          .update({
        'favoriteBooks': FieldValue.arrayUnion([book.toJson()])
      });
    } else {
      await fireStoreRepository.instance
          .collection('users')
          .doc(user.uid)
          .update({
        'favoriteBooks': FieldValue.arrayRemove([book.toJson()])
      });
    }
  }

  Future<void> removeFromFavorite() async {
    User? user = FirebaseAuth.instance.currentUser!;
    isFavorite = !isFavorite;
    await fireStoreRepository.instance
        .collection('users')
        .doc(user.uid)
        .update({
      'favoriteBooks': FieldValue.arrayRemove([book.toJson()])
    });
  }

  Future<void> inFavorite() async {
    User? user = FirebaseAuth.instance.currentUser!;
    try {
      await fireStoreRepository.instance
          .collection('users')
          .doc(user.uid)
          .get()
          .then((value) {
        List<dynamic> favoriteBooks = value.data()!['favoriteBooks'];
        for (var favoriteBook in favoriteBooks) {
          if (favoriteBook['title'] == book.title) {
            isFavorite = true;
            break;
          }
        }
      });
    } catch (e) {
      print(e);
    }
  }

  Future<PermissionStatus> requestPermission() async {
    var status = await Permission.storage.status;

    if (status.isDenied) {
      Permission.storage.request();
    }
    return status;
  }

  void _pushToRead(String bookPath) {
    Navigator.push(
      ctx,
      MaterialPageRoute(
        builder: (context) => BookReadView(
          bookPath: bookPath,
        ),
      ),
    );
  }
}
