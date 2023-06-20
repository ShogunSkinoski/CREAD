import 'dart:io';

import 'package:cread/view/library/model/book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class BookReadView extends StatefulWidget {
  final String bookPath;
  const BookReadView({super.key, required this.bookPath});

  @override
  State<BookReadView> createState() => _BookReadViewState();
}

class _BookReadViewState extends State<BookReadView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Book Read"),
      ),
      body: PDFView(
        onRender: (pages) {
          pages = 10;
        },
        filePath: widget.bookPath,
      ),
    );
  }
}
