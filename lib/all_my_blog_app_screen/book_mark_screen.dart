import 'package:final_project/all_my_blog_app_screen/blog_details_screen.dart';
import 'package:final_project/blog_home_screen/blog_model.dart';
import 'package:final_project/blog_home_screen/posts_model.dart';
import 'package:final_project/book_marks_screen/favourite_toggle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BookMarkScreen extends StatefulWidget {
  const BookMarkScreen({super.key});

  @override
  State<BookMarkScreen> createState() => _BookMarkScreenState();
}

class _BookMarkScreenState extends State<BookMarkScreen> {
  TextEditingController searchClt = TextEditingController();
  final FavouriteToggle favouriteToggle = Get.find<FavouriteToggle>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        // leading: Icon(Icons.arrow_back, color: Colors.white),
        title: Text(
          "Bookmarks",
          style: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          TextFormField(
            controller: searchClt,
            decoration: InputDecoration(
              hintText: "Search bookmarks",
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.search, color: Colors.grey),
            ),
          ),
          SizedBox(height: 10.h),

          Expanded(
            child: Obx(() {
              if (favouriteToggle.bookmark.isEmpty) {
                return Center(
                  child: Text(
                    "No Item add",
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }
              return ListView.builder(
                itemCount: favouriteToggle.bookmark.length,
                itemBuilder: (context, index) {
                  final book = favouriteToggle.bookmark[index];
                  return Card(
                    child: ListTile(
                      onTap: () {
                        Get.to(BlogDetailsScreen(post:book,));
                      },
                      leading: Image.network(
                        book.featuredImage,
                        height: 50.h,
                        width: 60.w,
                      ),
                      title: Text(
                        book.title,
                        style: TextStyle(color: Colors.black),
                      ),
                      subtitle: Text(
                        book.title,
                        style: TextStyle(color: Colors.black),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          favouriteToggle.togglebookmark(book);
                        },
                        icon: Icon(Icons.bookmark, color: Colors.red),
                      ),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
