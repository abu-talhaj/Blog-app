import 'package:final_project/all_my_blog_app_screen/edit_profile_screen.dart';
import 'package:final_project/all_my_blog_app_screen/update_password_screen.dart';
import 'package:final_project/login_register_logout_change_password_api/logout_controller.dart';
import 'package:final_project/profile_model_api/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ProfileController profileController = Get.put(ProfileController());
  final LogoutController logoutController = Get.put(LogoutController());

  @override
  void initState() {
    super.initState();
    profileController.loadProfile();
  }

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
        actions: [
          Icon(Icons.settings, color: Colors.white),
          SizedBox(width: 8.w),
        ],
      ),
      backgroundColor: Colors.black,
      body: Obx(() {
        if (profileController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        final profile = profileController.profile.value;

        if (profile == null) {
          return Center(
            child: Text(
              "No Profile Data",
              style: TextStyle(color: Colors.white),
            ),
          );
        }

        final user = profile.data.user;

        return Container(
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
                      user.name,
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      user.email,
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.white24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (user.phone.toString().isNotEmpty)
                      Text(
                        user.phone,
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
                  onPressed: () async {
                    // await logoutController.logout();
                  },
                  child:
                      // Obx(
                      //   () => logoutController.isLoading.value
                      //       ? CircularProgressIndicator()
                      //       :
                      Text(
                        "LogOut",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                  // ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white24,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
