import 'package:mobx/mobx.dart';
import 'package:cread/core/init/firebase/firestore_repository.dart';

import '../../library/model/book.dart';
part 'review_viewmodel.g.dart';

class ReviewViewModel = _ReviewViewModelBase with _$ReviewViewModel;

abstract class _ReviewViewModelBase with Store {
  FireStoreRepository fireStoreRepository = FireStoreRepository();
  @observable
  String review = '';

  @action
  void setReview(String value) {
    review = value;
  }

  Future<void> sendReview(String bookId, Book book) async {
    await fireStoreRepository.sendReview(bookId, review, book);
  }
}
