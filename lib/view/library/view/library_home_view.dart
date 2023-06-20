import 'package:cread/feature/widget/Drawer/drawer.dart';
import 'package:cread/view/library/model/book.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:cread/view/library/service/lib_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../core/base/view/base_view.dart';
import '../../../core/constants/app/route_names.dart';
import '../../../feature/widget/Card/book.dart';
import '../../book/view/book_details.dart';
import '../viewmodel/library_home_viewmodel.dart';

class LibraryHomeView extends StatefulWidget {
  const LibraryHomeView({super.key});

  @override
  State<LibraryHomeView> createState() => _LibraryHomeViewState();
}

class _LibraryHomeViewState extends State<LibraryHomeView> {
  LibraryHomeViewModel viewModel = LibraryHomeViewModel();
  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: LibraryHomeViewModel(),
      onModelReady: (viewModel) {
        viewModel.setContext(context);
        viewModel.init();
      },
      builder: (context, model) => buildScaffold(),
    );
  }

  Widget buildScaffold() {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        elevation: 0,
        title: Center(
          child: Text("Library", style: Theme.of(context).textTheme.titleLarge),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                  context: context,
                  delegate:
                      LibrarySearchDelegate(libraryHomeViewModel: viewModel));
            },
          )
        ],
      ),
      body: Column(children: [
        Observer(builder: (_) {
          return Expanded(
            child: FutureBuilder(
              future: viewModel.getBooks(),
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

class LibrarySearchDelegate extends SearchDelegate {
  final LibraryHomeViewModel libraryHomeViewModel;
  LibrarySearchDelegate({required this.libraryHomeViewModel});
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      ),
      IconButton(
        icon: const Icon(Icons.search),
        onPressed: () {
          libraryHomeViewModel.setSearchString(query);
          close(context, null);
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
