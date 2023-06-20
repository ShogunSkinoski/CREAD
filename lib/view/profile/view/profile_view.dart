import 'package:cread/core/base/view/base_view.dart';
import 'package:cread/feature/model/userprofile_model.dart';
import 'package:cread/feature/widget/Drawer/drawer.dart';
import 'package:cread/view/profile/viewmodel/profile_viewmodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../library/model/book.dart';
import 'friend_view.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  ProfileViewModel viewModel = ProfileViewModel();
  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: viewModel,
      builder: (context, model) => buildScaffold(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
    );
  }

  Widget buildScaffold() {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text('Profile'),
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Column(
      children: [
        buildProfile(),
        buildFriends(),
      ],
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
            SizedBox(height: 20),
            buildAchAndShare(),
            buildProfileImage(),
            buildProfileName(),
            buildProfileEmail(),
          ],
        ),
      ),
    );
  }

  Padding buildAchAndShare() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.emoji_events, color: Colors.black, size: 30),
          Icon(Icons.share, color: Colors.black, size: 30),
        ],
      ),
    );
  }

  CircleAvatar buildProfileImage() {
    return CircleAvatar(
      radius: 50,
      backgroundImage: NetworkImage("https://picsum.photos/200"),
    );
  }

  Row buildProfileName() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Observer(builder: (_) {
          return Text(
            viewModel.displayName == ''
                ? viewModel.user.displayName == null
                    ? viewModel.user.email!
                    : viewModel.user.displayName!
                : viewModel.displayName,
            style: TextStyle(fontSize: 20),
          );
        }),
        IconButton(
          onPressed: () {
            //alert dialog
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Change Name"),
                  content: TextField(
                    onChanged: (value) {
                      viewModel.displayName = value;
                    },
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        viewModel.changeName(viewModel.displayName);
                        Navigator.pop(context);
                      },
                      child: Text("Save"),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Cancel"),
                    ),
                  ],
                );
              },
            );
          },
          icon: Icon(Icons.edit, color: Colors.black, size: 15),
        ),
      ],
    );
  }

  Text buildProfileEmail() {
    return Text(
      viewModel.user.email!,
      style: TextStyle(fontSize: 20),
    );
  }

  Container buildFriends() {
    return Container(
      margin: const EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width,
      child: Card(
        elevation: 5,
        child: Column(
          children: [
            SizedBox(height: 20),
            buildFriendsHeader(),
            buildFriendsList(),
          ],
        ),
      ),
    );
  }

  Padding buildFriendsHeader() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Friends",
            style: TextStyle(fontSize: 20),
          ),
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Add Friend"),
                      content: TextField(
                        onChanged: (value) {
                          viewModel.friendEmail = value;
                        },
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            viewModel.addFriendByEmail(viewModel.friendEmail);
                            Navigator.pop(context);
                          },
                          child: Text("Add"),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Cancel"),
                        ),
                      ],
                    );
                  },
                );
              },
              icon: Icon(Icons.add, color: Colors.black, size: 30)),
        ],
      ),
    );
  }

  Container buildFriendsList() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      child: Observer(builder: (_) {
        return FutureBuilder<List<String>>(
          future: viewModel.getFriends(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return buildFriendItem(snapshot.data![index], index);
                },
              );
            } else {
              return Container();
            }
          },
        );
      }),
    );
  }

  GestureDetector buildFriendItem(String name, int index) {
    return GestureDetector(
      onTap: () async {
        //show friends favorite books
        final Map<String, dynamic> friend =
            await viewModel.getFriendByName(name);
        _navigateToNewPageWithArgument(context, friend);
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage:
                  NetworkImage("https://picsum.photos/250?image=$index"),
            ),
            SizedBox(width: 10),
            Text(
              name,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToNewPageWithArgument(
      BuildContext context, Map<String, dynamic> user) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FriendProfileView(
          friend: user,
          viewModel: viewModel,
        ),
      ),
    );
  }
}
