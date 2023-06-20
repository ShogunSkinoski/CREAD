import 'package:dio/dio.dart';

import '../../../core/constants/app/api_path.dart';
import '../../../core/init/network/network_service.dart';
import '../model/book.dart';
import 'lib_scrapper.dart';

class BookRepo {
  Future<List<Book>> getBooks(String bookTitle) async {
    if (bookTitle.isEmpty) return Future.value([]);
    List<String> bookIDList = await LibScrapper().getBookIDList(bookTitle);
    List<Book> books = [];
    List<String> queryParameters = _constructQueryParameters(bookIDList);

    try {
      var response = await NetworkService.instance.get(
        APIPath.BOOKS,
        {
          "ids": queryParameters[0],
          "fields": queryParameters[1],
        },
        null,
        Options(headers: {'Content-Type': 'application/json'}),
      );
      for (var book in response.data) {
        books.add(Book.fromJson(book));
      }
      for (var element in books) {
        element.coverurl = APIPath.COVER + element.coverurl!;
      }
      books.removeWhere((element) => element.extension != "pdf");
      return books;
    } catch (e) {
      return Future.value([]);
    }
  }

  List<String> _constructQueryParameters(List<String> bookIDList) {
    String ids = "";
    for (var element in bookIDList) {
      ids += "$element,";
    }
    String fields =
        "id, title, series, author, year, publisher, identifier, coverurl,descr,extension, ipfs_cid";
    return [ids, fields];
  }
}
