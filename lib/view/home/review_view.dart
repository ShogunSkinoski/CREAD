import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cread/feature/widget/Drawer/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:textfields/textfields.dart';

import '../library/model/book.dart';
import 'home_viewmodel/review_viewmodel.dart';

class ReviewView extends StatefulWidget {
  final Book book;
  const ReviewView({super.key, required this.book});

  @override
  State<ReviewView> createState() => _ReviewViewState();
}

class _ReviewViewState extends State<ReviewView> {
  ReviewViewModel viewModel = ReviewViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: const Text('Review'),
        ),
        body: buildBody());
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
        Text("Review", style: TextStyle(fontSize: 20)),
        //evaluation with full size textfield
        Expanded(
          child: SimpleTextFieldWithBorder(
              onChanged: (value) {
                viewModel.setReview(value);
              },
              label: "Review",
              bordercolor: Colors.black),
        ),
        Container(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () async {
                await viewModel.sendReview(widget.book.id!, widget.book);
                Navigator.pop(context);
              },
              child: Text("Send"),
            ))
      ],
      //send button
    );
  }
}
