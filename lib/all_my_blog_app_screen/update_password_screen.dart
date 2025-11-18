import 'package:final_project/login_register_logout_change_password_api/change_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class UpdatePasswordScreen extends StatefulWidget {
  const UpdatePasswordScreen({super.key});

  @override
  State<UpdatePasswordScreen> createState() => _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends State<UpdatePasswordScreen> {
  TextEditingController currentpassclt = TextEditingController();
  TextEditingController newpassClt = TextEditingController();
  TextEditingController confirmpassClt = TextEditingController();

  bool _isobscures = true;
  bool _isobscure = true;
  bool isobscure = true;

  final ChangePasswordController changePasswordController = Get.put(
    ChangePasswordController(),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Text(
          "Up date Password",
          style: TextStyle(
            fontSize: 22.h,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(height: 80.h),
              TextFormField(
                obscureText: _isobscures,
                controller: currentpassclt,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  hintText: "Enter your current password",
                  labelText: "Current Password",
                  filled: true,
                  fillColor: Color(0xff292E38),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isobscures = !_isobscures;
                      });
                    },
                    icon: Icon(
                      _isobscures
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              TextFormField(
                obscureText: _isobscure,
                controller: newpassClt,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  hintText: "Enter your new password",
                  labelText: "New Password",
                  filled: true,
                  fillColor: Color(0xff292E38),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isobscure = !_isobscure;
                      });
                    },
                    icon: Icon(
                      _isobscure
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              TextFormField(
                obscureText: isobscure,
                controller: confirmpassClt,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  hintText: "Enter your confirm password",
                  labelText: "Confirm Password",
                  filled: true,
                  fillColor: Color(0xff292E38),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isobscure = !isobscure;
                      });
                    },
                    icon: Icon(
                      isobscure
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 130.h),
              Obx(() {
                return changePasswordController.isLoading.value
                    ? CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () {
                          String current = currentpassclt.text.trim();
                          String newp = newpassClt.text.trim();
                          String confirm = confirmpassClt.text.trim();

                          if (current.isEmpty) {
                            Get.snackbar("_", "Enter current password");
                          }

                          if (newp.length < 8) {
                            Get.snackbar("_", "Enter Eight Digits password");
                          }
                          if (confirm != newp) {
                            Get.snackbar(
                              "_",
                              "Enter Eight Digits Confirm password",
                            );
                            return;
                          }
                          changePasswordController.UpDatePassword(
                            current,
                            newp,
                            confirm,
                          );
                        },
                        child: Text(
                          "Update Password",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 12.sp,
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffE36527),
                          padding: EdgeInsets.symmetric(
                            horizontal: 120.h,
                            vertical: 8.w,
                          ),
                        ),
                      );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
