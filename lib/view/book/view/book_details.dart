import 'package:cached_network_image/cached_network_image.dart';
import 'package:cread/view/book/viewmodel/book_details_viewmodel.dart';
import 'package:cread/view/home/review_view.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../core/base/view/base_view.dart';
import '../../../feature/widget/Drawer/drawer.dart';
import '../../library/model/book.dart';
import 'book_read.dart';

class BookDetailsView extends StatefulWidget {
  final Book book;
  BookDetailsView({super.key, required this.book});

  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  BookDetailsViewModel viewModel = BookDetailsViewModel();

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: viewModel,
      builder: (context, viewModel) => buildScaffold(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
        model.book = widget.book;
      },
    );
  }

  Scaffold buildScaffold() {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          Observer(builder: (_) {
            return IconButton(
              icon: Icon(viewModel.isFavorite
                  ? Icons.favorite
                  : Icons.favorite_border),
              onPressed: () {
                viewModel.isFavorite
                    ? viewModel.removeFromFavorite()
                    : viewModel.addToFavorite();
              },
            );
          }),
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ReviewView(
                            book: widget.book,
                          )));
            },
            icon: Icon(Icons.reviews),
          )
        ],
        title: Center(child: Text("Book Detail")),
      ),
      body: Container(
          color: Color.fromARGB(255, 231, 235, 238), child: buildBody()),
    );
  }

  Widget buildBody() {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "${widget.book.title}\n",
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                          text: widget.book.author,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w100),
                        )
                      ]),
                    ),
                  ),
                ),
                Expanded(
                  child: CachedNetworkImage(
                    imageUrl: widget.book.coverurl!,
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              ],
            ),
          ),
        ),
        Text("Description", style: TextStyle(fontSize: 20)),
        Expanded(
          flex: 1,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            ),
            child: SingleChildScrollView(
              child: AutoSizeText(
                widget.book.descr ?? "",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w100),
              ),
            ),
          ),
        ),
        Observer(builder: (_) {
          return Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  viewModel.readBook();
                },
                child: viewModel.inStorgae
                    ? Text("Read")
                    : viewModel.downloadProc == 0
                        ? Text("Download")
                        : Text("${viewModel.downloadProc}%"),
              ));
        })
      ],
    );
  }
}
