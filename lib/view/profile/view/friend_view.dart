import 'package:cread/feature/widget/Card/book.dart';
import 'package:cread/view/profile/viewmodel/profile_viewmodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../book/view/book_details.dart';
import '../../library/model/book.dart';

class FriendProfileView extends StatefulWidget {
  final Map<String, dynamic> friend;
  final ProfileViewModel viewModel;
  const FriendProfileView(
      {super.key, required this.friend, required this.viewModel});

  @override
  State<FriendProfileView> createState() => _FriendProfileViewState();
}

class _FriendProfileViewState extends State<FriendProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.friend['displayName']),
      ),
      body: Column(
        children: [
          buildProfile(),
          buildBooks(),
        ],
      ),
    );
  }

  Container buildProfile() {
    return Container(
      margin: const EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width,
      child: Card(
        elevation: 5,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              child: CircleAvatar(),
            ),
            Text(widget.friend['displayName']),
            Text(widget.friend['email']),
            Text(widget.friend['favoriteBooks'].length.toString()),
            Text(widget.friend['friends'].length.toString()),
          ],
        ),
      ),
    );
  }

  Expanded buildBooks() {
    return Expanded(
      child: ListView.builder(
        itemCount: widget.friend['favoriteBooks'].length,
        itemBuilder: (context, index) {
          return BookWidget(
            title: widget.friend['favoriteBooks'][index]['title'],
            author: widget.friend['favoriteBooks'][index]['author'],
            coverurl: widget.friend['favoriteBooks'][index]['coverurl'],
            year: widget.friend['favoriteBooks'][index]['year'],
            publisher: widget.friend['favoriteBooks'][index]['publisher'],
            onTap: () {
              _navigateToNewPageWithArgument(
                context,
                Book.fromJson(widget.friend['favoriteBooks'][index]),
              );
            },
          );
        },
      ),
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
