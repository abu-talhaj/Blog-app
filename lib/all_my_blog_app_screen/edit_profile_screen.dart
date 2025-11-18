import 'package:final_project/profile_model_api/profile_controller.dart';
import 'package:final_project/profile_model_api/up_date_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController displaynameClt = TextEditingController();
  TextEditingController phoneClt = TextEditingController();
  TextEditingController emailClt = TextEditingController();
  TextEditingController bioClt = TextEditingController();

  final UpDateProfileController upDateProfileController = Get.put(
    UpDateProfileController(),
  );
  final profileController = Get.find<ProfileController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final user = profileController.profile.value?.data.user;
    if (user != null) {
      displaynameClt.text = user.name;
      phoneClt.text = user.phone;
      emailClt.text = user.email;
      // bioClt.text = user.bio;
    }
  }

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
      body: Obx(() {
        if (upDateProfileController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
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
                      "Display Name",
                      style: TextStyle(fontSize: 10.sp, color: Colors.white),
                    ),
                    SizedBox(height: 4.h),
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller: displaynameClt,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xff292E38),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        hintText: "Enter your nickname",
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      "Phone",
                      style: TextStyle(fontSize: 10.sp, color: Colors.white),
                    ),
                    SizedBox(height: 4.h),
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller: phoneClt,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xff292E38),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        hintText: "Enter your phone number",
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      "Email",
                      style: TextStyle(fontSize: 10.sp, color: Colors.white),
                    ),
                    SizedBox(height: 15.h),
                    TextFormField(
                      controller: emailClt,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xff292E38),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        hintText: "Enter your email",
                      ),
                    ),
                    // SizedBox(height: 4.h),
                    // Text(
                    //   "Bio",
                    //   style: TextStyle(fontSize: 10.sp, color: Colors.white),
                    // ),
                    // SizedBox(height: 4.h),
                    // TextFormField(
                    //   style: TextStyle(color: Colors.white),
                    //   controller: bioClt,
                    //   maxLines: 4,
                    //   minLines: 4,
                    //   decoration: InputDecoration(
                    //     filled: true,
                    //     fillColor: Color(0xff292E38),
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(12),
                    //       borderSide: BorderSide.none,
                    //     ),
                    //     hintText: "Enter your Bio",
                    //   ),
                    // ),
                  ],
                ),
                SizedBox(height: 60.h),
                ElevatedButton(
                  onPressed: () async {
                    Map<String, dynamic> body = {
                      "display_name": displaynameClt.text,
                      "email": emailClt.text,
                      // "bio": bioClt.text,
                      "phone": phoneClt.text,
                    };
                    await upDateProfileController.putProfile(body);
                  },
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
        );
      }),
    );
  }
}
