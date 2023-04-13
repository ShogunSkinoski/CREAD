import 'package:cread/core/base/view/base_view.dart';
import 'package:cread/core/init/provider/theme_provider.dart';
import 'package:cread/view/settings/view/settings_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../../feature/widget/Drawer/drawer.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  SettingViewModel viewModel = SettingViewModel();
  @override
  Widget build(BuildContext context) {
    return BaseView(
        viewModel: viewModel,
        builder: (context, model) => buildScaffold(),
        onModelReady: (model) {
          model.setContext(context);
          model.init();
        });
  }

  Scaffold buildScaffold() {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text('Settings'),
      ),
      body: buildBody(),
    );
  }

  Column buildBody() {
    return Column(
      children: [
        buildGeneralSettings(),
        buildReadSettings(),
      ],
    );
  }

  Column buildGeneralSettings() {
    return Column(
      children: [
        buildGeneralSettingsTitle(),
        buildGeneralSettingsList(),
      ],
    );
  }

  Container buildGeneralSettingsTitle() {
    return Container(
      margin: const EdgeInsets.all(20),
      child: const Text(
        'General Settings',
        style: TextStyle(fontSize: 20),
      ),
    );
  }

  Container buildGeneralSettingsList() {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        children: [
          buildDarkMode(),
          buildLanguageSelector(),
        ],
      ),
    );
  }

  buildDarkMode() {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Dark Mode'),
          Observer(builder: (_) {
            return Switch(
              value: viewModel.isDarkMode,
              onChanged: (value) {
                viewModel.changeTheme();
              },
            );
          }),
        ],
      ),
    );
  }

  buildLanguageSelector() {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Language'),
          DropdownButton(
            value: viewModel.SelectedLanguage,
            items: [
              DropdownMenuItem(
                child: Text('English'),
                value: 'English',
              ),
              DropdownMenuItem(
                child: Text('Turkish'),
                value: 'Turkish',
              ),
            ],
            onChanged: (value) {
              viewModel.changeLanguage(value);
            },
          ),
        ],
      ),
    );
  }

  Column buildReadSettings() {
    return Column(
      children: [
        buildReadSettingsTitle(),
        buildReadSettingsList(),
      ],
    );
  }

  Container buildReadSettingsTitle() {
    return Container(
      margin: const EdgeInsets.all(20),
      child: const Text(
        'Read Settings',
        style: TextStyle(fontSize: 20),
      ),
    );
  }

  Container buildReadSettingsList() {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        children: [
          buildReadSettingsItem('Font Size'),
          buildReadSettingsItem('Font Type'),
          buildReadSettingsItem('Line Spacing'),
          buildReadSettingsItem('Text Color'),
          buildReadSettingsItem('Background Color'),
        ],
      ),
    );
  }

  Container buildReadSettingsItem(String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          const Icon(Icons.arrow_forward_ios),
        ],
      ),
    );
  }
}
