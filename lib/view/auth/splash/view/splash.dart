import 'package:cread/core/base/view/base_view.dart';
import 'package:flutter/material.dart';
import 'package:cread/view/auth/splash/viewmodel/splash_view_model.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../feature/widget/Indicator/page_indicator.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  SplashViewModel viewModel = SplashViewModel();
  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: viewModel,
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      builder: buildScaffold,
    );
  }

  Widget buildScaffold(BuildContext context, SplashViewModel viewModel) {
    PageController _pageController = PageController(initialPage: 0);
    viewModel.pageController = _pageController;
    return Scaffold(
      body: Column(children: [
        Expanded(
          flex: 3,
          child: PageView.builder(
              itemCount: viewModel.splashItems.length,
              controller: _pageController,
              onPageChanged: (value) {
                viewModel.setCurrentPage(value);
              },
              itemBuilder: (context, index) {
                return pageBuilder(viewModel, index);
              }),
        ),
      ]),
    );
  }

  Widget pageBuilder(SplashViewModel viewModel, int index) {
    return Column(
      children: [
        Expanded(
          flex: 10,
          child: Lottie.asset(viewModel.splashItems[index].splashPath),
        ),
        Expanded(
          flex: 2,
          child: splashContent(viewModel, index),
        ),
        Spacer(flex: 1),
        Expanded(flex: 1, child: indicatorBuilder(viewModel)),
        Spacer(flex: 1),
        Expanded(
          flex: 1,
          child: nextPageButton(viewModel),
        ),
      ],
    );
  }

  Column splashContent(SplashViewModel viewModel, int index) {
    return Column(
      children: [
        Text(viewModel.splashItems[index].title),
        Text(viewModel.splashItems[index].description),
      ],
    );
  }

  TextButton nextPageButton(SplashViewModel viewModel) {
    return TextButton(
      onPressed: () {
        viewModel.nextPage();
      },
      child: Text('Next'),
    );
  }

  ListView indicatorBuilder(SplashViewModel viewModel) {
    return ListView.builder(
      itemCount: 3,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Observer(
          builder: (_) {
            return PageIndicator(
              is_selected: viewModel.currentPage == index,
            );
          },
        );
      },
    );
  }
}
