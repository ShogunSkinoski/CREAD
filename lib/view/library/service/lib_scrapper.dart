import 'package:cread/core/constants/app/api_path.dart';
import 'package:cread/core/init/network/network_service.dart';
import 'package:dio/dio.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart';

class LibScrapper {
  Future<List<String>> getBookIDList(String bookTitle) async {
    var page = await getHTMLPage(bookTitle);
    var document = parse(page);

    var bookIDList = <String>[]; // List of book IDs

    Element bookTable = document.getElementsByTagName("table")[2];
    List<Element> bookRows = bookTable.getElementsByTagName("tr");
    bookRows.removeAt(0);
    for (Element book in bookRows) {
      List<Element> bookColumns = book.getElementsByTagName('td');
      bookIDList.add(bookColumns[0].text);
    }
    return bookIDList;
  }

  Future<dynamic> getHTMLPage(String bookTitle) async {
    try {
      var response = await NetworkService.instance.get(
        APIPath.SEARCH,
        {
          'req': bookTitle,
          'column': 'title',
        },
        null,
        Options(headers: {'Content-Type': 'text/html'}),
      );
      return response.data;
    } catch (e) {
      throw Exception("getHTMLPage() failed ${e.toString()}");
    }
  }
}
