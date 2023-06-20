import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../view/library/model/book.dart';

abstract class IFireStoreRepository {
  Future<void> addUser(User user);
  Future<void> addFriend(User user, User friend);
  Future<void> removeFriend(User user, User friend);
  Future<void> addBook(User user, Book book);
}

class FireStoreRepository implements IFireStoreRepository {
  final FirebaseFirestore instance = FirebaseFirestore.instance;
  Future<List<Map<String, dynamic>>> getEvaluation() async {
    List<Map<String, dynamic>> evaluationList = [{}];
    var evaluation = await instance.collection('books').get();
    for (var element in evaluation.docs) {
      evaluationList.add(element.data());
    }
    return evaluationList;
  }

  Future<String> getUserEmail(String userId) async {
    var user = await instance.collection('users').doc(userId).get();
    return user.data()!['email'];
  }

  @override
  Future<void> addUser(User user) async {
    await instance.collection('users').doc(user.uid).set({
      'email': user.email,
      'displayName': user.displayName,
      'photoURL': user.photoURL,
      'friends': [],
      'books': [],
    });
  }

  @override
  Future<void> addBook(User user, Book book) {
    // TODO: implement addBook
    throw UnimplementedError();
  }

  @override
  Future<void> addFriend(User user, User friend) {
    // TODO: implement addFriend
    throw UnimplementedError();
  }

  @override
  Future<void> removeFriend(User user, User friend) {
    // TODO: implement removeFriend
    throw UnimplementedError();
  }

  @override
  Future<void> sendReview(String bookId, String review, Book book) async {
    await instance.collection('books').doc(bookId).set({
      'review': review,
      'userId': FirebaseAuth.instance.currentUser!.uid,
      'bookName': book.title,
      'bookAuthor': book.author,
      'bookCoverUrl': book.coverurl,
      'bookPublisher': book.publisher,
      'bookYear': book.year,
      'date': DateTime.now()
    });
  }
}
