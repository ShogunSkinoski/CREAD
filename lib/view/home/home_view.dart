import 'package:cread/core/base/view/base_view.dart';
import 'package:cread/view/home/home_viewmodel/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../../feature/model/userprofile_model.dart';
import '../../feature/widget/Card/evalution.dart';
import '../../feature/widget/Drawer/drawer.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeViewModel viewModel = HomeViewModel();
  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: viewModel,
      builder: (context, viewModel) => buildScaffold(),
      onModelReady: (viewModel) {
        viewModel.setContext(context);
        viewModel.init();
      },
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
    return Column(
      children: [
        // get every evaluation from database
        Expanded(
          child: FutureBuilder<List<Map<String, dynamic>>>(
            future: viewModel.getEvaluation(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return const SizedBox(
                        height: 1,
                      );
                    }
                    return EvaluationCard(
                      evaluation: snapshot.data![index],
                    );
                  },
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
