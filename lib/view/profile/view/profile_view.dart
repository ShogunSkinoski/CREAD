import 'package:cread/core/base/view/base_view.dart';
import 'package:cread/feature/model/userprofile_model.dart';
import 'package:cread/feature/widget/Drawer/drawer.dart';
import 'package:cread/view/profile/viewmodel/profile_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

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
        Text(
          "Name",
          style: TextStyle(fontSize: 20),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.edit, color: Colors.black, size: 15),
        ),
      ],
    );
  }

  Text buildProfileEmail() {
    return Text(
      UserProfile.EMAIL,
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
          Icon(Icons.add, color: Colors.black, size: 30),
        ],
      ),
    );
  }

  Container buildFriendsList() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          return buildFriendItem(index);
        },
      ),
    );
  }

  Padding buildFriendItem(int index) {
    return Padding(
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
            "Friend $index",
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
