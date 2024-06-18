import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:islam_tiktok/constants.dart';
import 'package:islam_tiktok/controllers/profile_controller.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key, required this.uid});
  final String uid;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ProfileController profileController = Get.put(ProfileController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    profileController.updateUserId(widget.uid);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (controller) {
        if (controller.user.isEmpty) {
          return Center(child: CircularProgressIndicator());
        }
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black12,
            leading: Icon(Icons.person_add_alt_1_outlined),
            actions: [Icon(Icons.more_horiz)],
            centerTitle: true,
            title: Text(
              controller.user['name'],
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
          body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                            children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipOval(
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: controller.user['profilePhoto'],
                            height: 100,
                            width: 100,
                            placeholder: (context, url) =>
                                CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              controller.user['following'],
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Following',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          color: Colors.black54,
                          width: 1,
                          height: 15,
                          margin: EdgeInsets.symmetric(horizontal: 15),
                        ),
                        Column(
                          children: [
                            Text(
                              controller.user['followers'],
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Followers',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          color: Colors.black54,
                          width: 1,
                          height: 15,
                          margin: EdgeInsets.symmetric(horizontal: 15),
                        ),
                        Column(
                          children: [
                            Text(
                              controller.user['likes'],
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Likes',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: 140,
                      height: 47,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12)),
                      child: Center(
                          child: InkWell(
                              onTap: () {
                                if (widget.uid == authcontroller.user.uid) {
                                  authcontroller.signOut();
                                } else {
                                  controller.followUser();
                                }
                              },
                              child: Text(
                                widget.uid == authcontroller.user.uid
                                    ? 'Sign Out'
                                    : controller.user['isFollowing']
                                        ? 'UnFollow'
                                        : 'Follow',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ))),
                    ),
                    // IMAGES
                    GridView.builder(shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: controller.user['thumbnails'].length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1,
                            crossAxisSpacing: 5),
                        itemBuilder: (context, index) {
                          String thumbnail = controller.user['thumbnails'][index];
                          return CachedNetworkImage(
                              imageUrl: thumbnail, fit: BoxFit.cover);
                        })
                  ],
                )
                            ],
                          ),
              )),
        );
      },
    );
  }
}
