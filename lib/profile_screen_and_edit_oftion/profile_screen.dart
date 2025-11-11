import 'package:final_project/profile_screen_and_edit_oftion/edit_profile_screen.dart';
import 'package:final_project/update_password/update_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Profile",
          style: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [Icon(Icons.settings, color: Colors.white)],
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
              SizedBox(height: 12.h),
              Column(
                children: [
                  Text(
                    "Abu Talhaj",
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "abutalhaj7789@gmail.com",
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: Colors.white24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Software Engineer",
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: Colors.white24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditProfileScreen(),
                    ),
                  );
                },
                leading: Icon(Icons.edit, color: Colors.white),
                title: Text(
                  "Edit Profile",
                  style: TextStyle(color: Colors.white),
                ),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.brown),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UpdatePasswordScreen(),
                    ),
                  );
                },
                leading: Icon(Icons.lock_outline_sharp, color: Colors.white),
                title: Text(
                  "Update password",
                  style: TextStyle(color: Colors.white),
                ),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.brown),
              ),
              SizedBox(height: 230.h),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  "LogOut",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white24,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
