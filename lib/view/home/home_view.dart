import 'package:cread/core/base/view/base_view.dart';
import 'package:cread/view/home/home_viewmodel/home_viewmodel.dart';
import 'package:flutter/material.dart';

import '../../feature/model/userprofile_model.dart';
import '../../feature/widget/Card/evalution.dart';
import '../../feature/widget/Drawer/drawer.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: HomeViewModel(),
      builder: (context, viewModel) => buildScaffold(),
      onModelReady: (viewModel) {},
    );
  }

  buildScaffold() {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text('Home'),
      ),
      body: buildBody(),
    );
  }

  buildBody() {
    return ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: EvaluationCard(),
          );
        });
  }
}
