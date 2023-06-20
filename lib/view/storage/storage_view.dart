import 'package:cread/core/base/view/base_view.dart';
import 'package:cread/view/storage/storage_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../feature/widget/Card/book.dart';
import '../../feature/widget/Drawer/drawer.dart';
import '../book/view/book_details.dart';
import '../library/model/book.dart';

class DownloadedBooks extends StatefulWidget {
  const DownloadedBooks({super.key});

  @override
  State<DownloadedBooks> createState() => _DownloadedBooksState();
}

class _DownloadedBooksState extends State<DownloadedBooks> {
  StorageViewModel viewModel = StorageViewModel();
  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: viewModel,
      builder: (context, viewModel) => buildScaffold(),
      onModelReady: (viewModel) {
        viewModel.setContext(context);
        viewModel.init();
      },
    );
  }

  buildScaffold() {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text("Downloaded Books"),
      ),
      body: Column(children: [
        Observer(builder: (_) {
          return Expanded(
            child: FutureBuilder(
              future: viewModel.getBooksFromStorage(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  List<Book> books = snapshot.data as List<Book>;
                  if (books.isEmpty) {
                    return const Center(
                      child: Text(
                        "No books found",
                      ),
                    );
                  }
                  return buildBookList(books);
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          );
        }),
      ]),
    );
  }

  Widget buildBookList(List<Book> books) {
    return ListView.builder(
      itemCount: books.length,
      itemBuilder: (context, index) {
        return BookWidget(
          title: books[index].title!,
          author: books[index].author!,
          publisher: books[index].publisher!,
          year: books[index].year!,
          coverurl: books[index].coverurl!,
          onTap: () {
            _navigateToNewPageWithArgument(context, books[index]);
          },
        );
      },
    );
  }

  void _navigateToNewPageWithArgument(BuildContext context, Book book) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BookDetailsView(
          book: book,
        ),
      ),
    );
  }
}
