import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cread/core/base/model/base_view_model.dart';
import 'package:cread/core/init/firebase/firestore_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../library/model/book.dart';
part 'profile_viewmodel.g.dart';

class ProfileViewModel = _ProfileViewModelBase with _$ProfileViewModel;

abstract class _ProfileViewModelBase with Store, BaseViewModel {
  FireStoreRepository fireStoreRepository = FireStoreRepository();
  String friendEmail = '';
  @observable
  String displayName = '';
  @observable
  User user = FirebaseAuth.instance.currentUser!;
  @action
  Future<void> changeName(String name) async {
    await user.updateDisplayName(name);
    //also update in firestore
    fireStoreRepository.instance.collection('users').doc(user.uid).update({
      'displayName': name,
    });
  }

  Future<List<String>> getFriends() async {
    List<String> friends = [];
    await fireStoreRepository.instance
        .collection('users')
        .doc(user.uid)
        .get()
        .then((value) {
      friends = List<String>.from(value.data()!['friends']);
    });
    return friends;
  }

  Future<Map<String, dynamic>> getFriendByName(String name) async {
    Map<String, dynamic> friend = {};
    await fireStoreRepository.instance
        .collection('users')
        .where('displayName', isEqualTo: name)
        .get()
        .then((value) {
      friend = value.docs.first.data();
    });
    return friend;
  }

  Future<void> addFriendByEmail(String email) async {
    Map<String, dynamic>? friend;
    await fireStoreRepository.instance
        .collection('users')
        .where('email', isEqualTo: email)
        .get()
        .then((value) {
      friend = value.docs.first.data();
    });
    if (friend != null) {
      await fireStoreRepository.instance
          .collection('users')
          .doc(user.uid)
          .update({
        'friends': FieldValue.arrayUnion([friend!['displayName']])
      });
    }
  }

  Future<List<Book>> getFriendsFavoriteBooks() async {
    List<Book> books = [];
    List<String> friends = await getFriends();
    for (String friend in friends) {
      await fireStoreRepository.instance
          .collection('users')
          .where('displayName', isEqualTo: friend)
          .get()
          .then((value) async {
        List<String> bookTitles =
            List<String>.from(value.docs.first.data()['books']);
        for (String title in bookTitles) {
          await fireStoreRepository.instance
              .collection('books')
              .where('title', isEqualTo: title)
              .get()
              .then((value) {
            books.add(Book.fromJson(value.docs.first.data()));
          });
        }
      });
    }
    return books;
  }

  @override
  void setContext(BuildContext context) => ctx = context;
  @override
  void init() {}
  @override
  void dispose() {}
}
