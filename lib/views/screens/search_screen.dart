import 'package:flutter/material.dart';
import 'package:islam_tiktok/controllers/search_controller.dart';
import 'package:get/get.dart';
import 'package:islam_tiktok/models/user.dart';
import 'package:islam_tiktok/views/screens/profile_screen.dart';

class SearchScreen extends StatelessWidget {
  final SearchControllermou searchController = Get.put(SearchControllermou());
  SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
            title: TextFormField(
              decoration: InputDecoration(
                  filled: false,
                  hintText: 'Search',
                  hintStyle: TextStyle(fontSize: 18, color: Colors.white)),
              onFieldSubmitted: (value) => searchController.searchUser(value),
            ),
          ),
          body: searchController.searchedUsers.isEmpty
              ? Center(
                  child: Text(
                  'Search for users!',
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ))
              : ListView.builder(
                  itemCount: searchController.searchedUsers.length,
                  itemBuilder: (context, index) {
                    User user = searchController.searchedUsers[index];
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ProfileScreen(uid: user.uid,)));
                      },
                      child: ListTile(
                        leading: CircleAvatar(
                            backgroundImage: NetworkImage(user.profilePhoto)),
                        title: Text(user.name,
                            style:
                                TextStyle(fontSize: 18, color: Colors.white)),
                      ),
                    );
                  },
                ));
    });
  }
}
