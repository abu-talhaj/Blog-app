import 'package:final_project/blog_home_screen/blog_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookMarkScreen extends StatefulWidget {
  const BookMarkScreen({super.key});

  @override
  State<BookMarkScreen> createState() => _BookMarkScreenState();
}

class _BookMarkScreenState extends State<BookMarkScreen> {
  TextEditingController searchClt = TextEditingController();
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
            child: ListView.builder(
              itemCount: bookmarkList.length,
              itemBuilder: (context, index) {
                final book = bookmarkList[index];
                return Card(
                  child: ListTile(
                    leading: Image.asset(book.image, height: 50.h, width: 60.w),
                    title: Text(
                      book.title,
                      style: TextStyle(color: Colors.black),
                    ),
                    subtitle: Text(
                      book.description,
                      style: TextStyle(color: Colors.black),
                    ),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.bookmark, color: Colors.red),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
