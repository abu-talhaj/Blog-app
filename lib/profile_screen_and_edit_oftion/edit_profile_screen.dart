import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController displaynameClt = TextEditingController();
  TextEditingController emailClt = TextEditingController();
  TextEditingController bioClt = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Text(
          "Edit Profile",
          style: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Container(
        padding: EdgeInsets.only(left: 15.w, top: 25.h, right: 15.w),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      height: 140.h,
                      width: 140.w,
                      decoration: BoxDecoration(
                        border: Border.all(width: 4.w, color: Colors.white),
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage("assets/images/jpg/three.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.h),
              Column(
                children: [
                  Text(
                    "Abu Talhaj",
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "abutalhaj78@gmail.com",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white24,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Disply Name",
                    style: TextStyle(fontSize: 18.sp, color: Colors.white),
                  ),
                  SizedBox(height: 15.h),
                  TextFormField(
                    controller: displaynameClt,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter your nickname",
                      labelText: "Name",
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "Email",
                    style: TextStyle(fontSize: 18.sp, color: Colors.white),
                  ),
                  SizedBox(height: 15.h),
                  TextFormField(
                    controller: emailClt,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter your email",
                      labelText: "Email",
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "Bio",
                    style: TextStyle(fontSize: 18.sp, color: Colors.white),
                  ),
                  SizedBox(height: 15.h),
                  TextFormField(
                    controller: bioClt,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter your Bio",
                      labelText: "Bio",
                    ),
                  ),
                ],
              ),
              SizedBox(height: 60.h),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Save Changes",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffE36527),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
