import 'package:final_project/blog_home_screen/blog_model.dart';
import 'package:final_project/book_marks_screen/favourite_toggle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../blog_home_screen/posts_model.dart';
import '../like_api/like_api_controller.dart';

class BlogDetailsScreen extends StatefulWidget {
  final Post post;
  const BlogDetailsScreen({super.key, required this.post});

  @override
  State<BlogDetailsScreen> createState() => _BlogDetailsScreenState();
}

class _BlogDetailsScreenState extends State<BlogDetailsScreen> {
  List<String> comments = [];
  bool showCommentField = false;
  TextEditingController commentController = TextEditingController();
  final LikeApiController likeApiController = Get.put(LikeApiController());
  final FavouriteToggle favouriteToggle = Get.find<FavouriteToggle>();

  @override
  Widget build(BuildContext context) {
    final bh = widget.post;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back, color: Colors.white),
        ),
        actions: [
          Obx(() {
            final isLove = favouriteToggle.islove(widget.post);
            return IconButton(
              onPressed: () {
                favouriteToggle.togglebookmark(widget.post);
              },
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
        child: Padding(
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
                leading: CircleAvatar(
                  child: Image.network(
                    bh.featuredImage,
                    height: 50.h,
                    width: 25.w,
                  ),
                ),
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
              Container(
                height: 400.h,
                width: double.infinity.w,
                child: Column(
                  children: [
                    Text(
                      bh.content,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 12,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Obx(
                              () => IconButton(
                                onPressed: () {
                                  likeApiController.likes(bh.id, "token");
                                },
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
                              icon: Icon(
                                Icons.comment_outlined,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              "${comments.length}",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  CircleAvatar(),
                  SizedBox(width: 4.w),
                  Expanded(
                    child: TextField(
                      minLines: 1,
                      controller: commentController,
                      style: TextStyle(fontSize: 12.sp, color: Colors.white),
                      decoration: InputDecoration(
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
                    onPressed: () {},
                    icon: Icon(Icons.send, color: Colors.greenAccent),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
