import 'package:cread/core/base/model/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:cread/core/init/firebase/firestore_repository.dart';

part 'home_viewmodel.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store, BaseViewModel {
  FireStoreRepository fireStroreRepository = FireStoreRepository();
  @override
  void init() {}

  @override
  void dispose() {}

  @override
  void setContext(BuildContext context) => ctx = context;
  Future<List<Map<String, dynamic>>> getEvaluation() async {
    List<Map<String, dynamic>> evaluationList = [];
    evaluationList = await fireStroreRepository.getEvaluation();
    return evaluationList;
  }
}
