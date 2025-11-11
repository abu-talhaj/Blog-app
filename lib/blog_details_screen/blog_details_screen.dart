import 'package:final_project/blog_home_screen/blog_model.dart';
import 'package:final_project/book_marks_screen/book_mark_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BlogDetailsScreen extends StatefulWidget {
  final BlogModel blog;
  const BlogDetailsScreen({super.key, required this.blog});

  @override
  State<BlogDetailsScreen> createState() => _BlogDetailsScreenState();
}

class _BlogDetailsScreenState extends State<BlogDetailsScreen> {
  int like = 0;
  bool likes = false;
  TextEditingController commentController = TextEditingController();
  List<String> comments = [];
  bool showCommentField = false;
  bool isBookmark = false;
  bool love = true;

  @override
  Widget build(BuildContext context) {
    final bh = widget.blog;
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
          InkWell(
            onTap: () {
              setState(() {
                if (bookmarkList.contains(widget.blog)) {
                  bookmarkList.remove(widget.blog);
                  isBookmark = false;
                }
                else{
                  bookmarkList.add(widget.blog);
                  isBookmark=true;
                }
              });
            },
            child: Icon(
              love ? Icons.bookmark_add_sharp : Icons.bookmark_add_outlined,
              color: love ? Colors.brown : Colors.red,
            ),
          ),
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
                child: Image.asset(
                  bh.image,
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
                  child: Image.asset(bh.image, height: 50.h, width: 25.w),
                ),
                title: Text(
                  bh.listtiltetext,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                subtitle: Text(
                  bh.listtiltetexts,
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
                child: Expanded(
                  child: Column(
                    children: [
                      Text(
                        bh.description,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.white70,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (!likes) {
                                        like++;
                                        likes = true;
                                      } else {
                                        like--;
                                        likes = false;
                                      }
                                    });
                                  },
                                  icon: Icon(
                                    likes
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: likes ? Colors.red : Colors.brown,
                                  ),
                                ),
                                Text(
                                  "$like",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      showCommentField = !showCommentField;
                                    });
                                  },
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
                            // ListView.builder(
                            //   shrinkWrap: true,
                            //   physics: NeverScrollableScrollPhysics(),
                            //   itemCount: comments.length,
                            //   itemBuilder: (context, index) {
                            //     return ListTile(
                            //       leading: CircleAvatar(),
                            //       title: Text(comments[index]),
                            //     );
                            //   },
                            // ),
                            // Container(
                            //   padding: EdgeInsets.symmetric(
                            //     horizontal: 10.h,
                            //     vertical: 7.w,
                            //   ),
                            //   child: Row(
                            //     children: [
                            //       Expanded(
                            //         child: TextFormField(
                            //           controller: commentController,
                            //           decoration: InputDecoration(
                            //             hintText: "Write a comments",
                            //             border: InputBorder.none,
                            //           ),
                            //         ),
                            //       ),
                            //       IconButton(
                            //         onPressed: () {
                            //           if (commentController.text.trim().isEmpty)
                            //             return;
                            //           setState(() {
                            //             comments.add(
                            //               commentController.text.trim(),
                            //             );
                            //             commentController.clear();
                            //           });
                            //         },
                            //         icon: Icon(Icons.send, color: Colors.green),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
