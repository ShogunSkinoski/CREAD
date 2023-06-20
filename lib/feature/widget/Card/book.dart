import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';

class BookWidget extends StatelessWidget {
  final String title;
  final String author;
  final String publisher;
  final String year;
  final String coverurl;
  final Function? onTap;
  const BookWidget({
    super.key,
    required this.title,
    required this.author,
    required this.publisher,
    required this.year,
    required this.coverurl,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!();
      },
      child: Card(
        shadowColor: Colors.black,
        elevation: 5,
        surfaceTintColor: Colors.blueAccent[600],
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(
            child: CachedNetworkImage(
              imageUrl: coverurl,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              fit: BoxFit.fill,
            ),
          ),
          const Padding(padding: EdgeInsets.all(10)),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
                Text(author,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    )),
                Text(publisher,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    )),
                Text(year,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    )),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
