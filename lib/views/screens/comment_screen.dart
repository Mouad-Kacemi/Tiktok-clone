import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islam_tiktok/constants.dart';
import 'package:islam_tiktok/controllers/comment_controller.dart';
import "package:timeago/timeago.dart" as tago;

class CommentScreen extends StatelessWidget {
  final String id;
  CommentScreen({super.key, required this.id});
  final TextEditingController _commentController = TextEditingController();
  CommentController commentController = Get.put(CommentController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    commentController.updatePostId(id);
    return Scaffold(
        body: SingleChildScrollView(
            child: SizedBox(
                width: size.width,
                height: size.height,
                child: Column(children: [
                  Expanded(child: Obx(
                    () {
                      return ListView.builder(
                          itemCount: commentController.comments.length,
                          itemBuilder: (context, index) {
                            final comment = commentController.comments[index];
                            return ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.black,
                                backgroundImage:
                                    NetworkImage(comment.profilePhoto),
                              ),
                              title: Row(children: [
                                Text('${comment.username}   ',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.red,
                                        fontWeight: FontWeight.w700)),
                                Text(comment.comment,
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500)),
                              ]),
                              subtitle: Row(children: [
                                Text(
                                  tago.format(
                                    comment.datePublished.toDate(),
                                  ),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '${comment.likes.length} likes',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ]),
                              trailing: InkWell(
                                  onTap: () {
                                    commentController.likeComment(comment.id);
                                  },
                                  child: Icon(
                                    Icons.favorite,
                                    size: 25,
                                    color:comment.likes.contains(authcontroller.user.uid)? Colors.red: Colors.white,
                                  )),
                            );
                          });
                    },
                  )),
                  Divider(),
                  ListTile(
                    title: TextFormField(
                      controller: _commentController,
                      style: TextStyle(fontSize: 16, color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'Comment',
                        labelStyle: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red)),
                      ),
                    ),
                    trailing: TextButton(
                      child: Text(
                        'Send',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      onPressed: () {
                        commentController.postComment(_commentController.text);
                      },
                    ),
                  )
                ]))));
  }
}
