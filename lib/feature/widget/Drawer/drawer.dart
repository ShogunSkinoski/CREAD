// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:cread/core/base/view/base_view.dart';
import 'package:cread/core/init/firebase/firestore_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../model/userprofile_model.dart';
import '../../viewmodel/drawer/drawer_viewmodel.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => CustomDrawerState();
}

class CustomDrawerState extends State<CustomDrawer> {
  User? user = FirebaseAuth.instance.currentUser!;
  DrawerViewModel viewModel = DrawerViewModel();
  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: viewModel,
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      builder: (context, model) => buildDrawer(),
    );
  }

  Drawer buildDrawer() {
    return Drawer(
      elevation: 0,
      shadowColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.black, width: 2),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: ListView(
        children: [
          drawHeader(),
          ListTile(
            title: const Text('Home'),
            onTap: () {
              viewModel.navigateToHomePage();
            },
            leading: const Icon(Icons.home, color: Colors.black),
          ),
          ListTile(
            title: const Text('Library'),
            onTap: () {
              viewModel.navigateToLibraryPage();
            },
            leading: const Icon(Icons.book, color: Colors.black),
          ),
          ListTile(
            title: const Text('Storage'),
            onTap: () {
              viewModel.navigateToStoragePage();
            },
            leading: const Icon(Icons.storage, color: Colors.black),
          ),
          ListTile(
            title: const Text('Profile'),
            onTap: () {
              viewModel.navigateToProfilePage();
            },
            leading: const Icon(Icons.person, color: Colors.black),
          ),
          ListTile(
            title: const Text('Settings'),
            onTap: () {
              viewModel.navigateToSettingsPage();
            },
            leading: const Icon(Icons.settings, color: Colors.black),
          ),
        ],
      ),
    );
  }

  DrawerHeader drawHeader() {
    return DrawerHeader(
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.black, width: 2),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage("https://picsum.photos/200"),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(user!.displayName ?? "User Name"),
                    Text(user!.email ?? "User Email"),
                  ],
                ),
              ]),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(color: Color.fromARGB(255, 197, 225, 248)),
    );
  }
}
