import 'package:final_project/blog_home_screen/posts_model.dart';
import 'package:final_project/book_marks_screen/favourite_toggle.dart';
import 'package:final_project/like_api/like_api_controller.dart';
import 'package:final_project/comment_api_model/comment_controller.dart';
import 'package:final_project/comment_api_model/comment_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BlogDetailsScreen extends StatefulWidget {
  final Post post;
  const BlogDetailsScreen({super.key, required this.post});

  @override
  State<BlogDetailsScreen> createState() => _BlogDetailsScreenState();
}

class _BlogDetailsScreenState extends State<BlogDetailsScreen> {
  final LikeApiController likeApiController = Get.put(LikeApiController());
  final FavouriteToggle favouriteToggle = Get.find<FavouriteToggle>();
  final CommentController commentControllerApi = Get.put(CommentController());
  final TextEditingController commentController = TextEditingController();
  // Load comments for this post from API
  @override
  void initState() {
    super.initState();
    commentControllerApi.loadComments(widget.post.id);
  }

  @override
  Widget build(BuildContext context) {
    final bh = widget.post;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back, color: Colors.white),
        ),
        actions: [
          Obx(() {
            final isLove = favouriteToggle.islove(bh);
            return IconButton(
              onPressed: () => favouriteToggle.togglebookmark(bh),
              icon: Icon(
                isLove ? Icons.bookmark_add_sharp : Icons.bookmark_add_outlined,
                color: isLove ? Colors.deepPurple : Colors.redAccent,
              ),
            );
          }),
          SizedBox(width: 15.w),
        ],
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              child: Image.network(
                bh.featuredImage,
                height: 400.h,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              bh.title,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10.h),
            ListTile(
              leading: CircleAvatar(child: Image.network(bh.featuredImage)),
              title: Text(
                bh.title,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              subtitle: Text(
                bh.excerpt,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ),
            ),
            Text(
              bh.content,
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.white70,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Obx(
                      () => IconButton(
                        onPressed: () =>
                            likeApiController.likes(bh.id, "token"),
                        icon: Icon(
                          likeApiController.isLiked.value
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: likeApiController.isLiked.value
                              ? Colors.red
                              : Colors.brown,
                        ),
                      ),
                    ),
                    Obx(
                      () => Text(
                        "${likeApiController.likesCount.value}",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.comment_outlined, color: Colors.grey),
                    ),
                    Obx(
                      () => Text(
                        "${commentControllerApi.comments.length}",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                CircleAvatar(),
                SizedBox(width: 4.w),
                Expanded(
                  child: TextField(
                    controller: commentController,
                    style: TextStyle(fontSize: 12.sp, color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Add a comment",
                      hintStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Color(0xff292E38),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    if (commentController.text.isNotEmpty) {
                      bool success = await commentControllerApi.addNewComment(
                        bh.id,
                        commentController.text,
                      );
                      if (success) commentController.clear();
                    }
                  },
                  icon: Icon(Icons.send, color: Colors.greenAccent),
                ),
              ],
            ),
            SizedBox(height: 15.h),
            Obx(() {
              if (commentControllerApi.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              }
              if (commentControllerApi.comments.isEmpty) {
                return Text(
                  "No comments yet",
                  style: TextStyle(color: Colors.white),
                );
              }
              return ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: commentControllerApi.comments.length,
                itemBuilder: (context, index) {
                  CommentModel comment = commentControllerApi.comments[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.deepPurple,
                      child: Text(
                        comment.user[0].toUpperCase(),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    title: Text(
                      comment.user,
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      comment.comment,
                      style: TextStyle(color: Colors.white70),
                    ),
                  );
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
