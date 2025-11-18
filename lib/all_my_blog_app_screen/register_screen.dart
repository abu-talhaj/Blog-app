import 'package:final_project/all_my_blog_app_screen/login_screen.dart';
import 'package:final_project/login_register_logout_change_password_api/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final RegisterController registerController = Get.put<RegisterController>(
    RegisterController(),
  );

  bool _isobscure = true;
  bool isobscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40.h),
              Text(
                "Create Account",
                style: TextStyle(
                  fontSize: 28.h,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 40.h),
              TextFormField(
                controller: registerController.usernameClt,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  hintText: "Enter your name",
                  filled: true,
                  fillColor: Color(0xff292E38),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  suffixIcon: Icon(Icons.text_snippet_outlined),
                ),
              ),
              SizedBox(height: 40.h),
              TextFormField(
                controller: registerController.emailClt,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  hintText: "Enter your email",
                  filled: true,
                  fillColor: Color(0xff292E38),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  suffixIcon: Icon(Icons.email),
                ),
              ),
              SizedBox(height: 40.h),
              TextFormField(
                obscureText: _isobscure,
                controller: registerController.passwordClt,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  hintText: "Enter your password",
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
              SizedBox(height: 40.h),

              TextFormField(
                controller: registerController.phoneClt,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  hintText: "Enter your phone number",
                  filled: true,
                  fillColor: Color(0xff292E38),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  suffixIcon: Icon(Icons.phone),
                ),
              ),
              SizedBox(height: 90.h),

              Obx(
                () => registerController.isLoading.value
                    ? CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () {
                          registerController.register();
                        },
                        child: Text(
                          "Register",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14.sp,
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffE36527),
                          padding: EdgeInsets.symmetric(
                            horizontal: 140.h,
                            vertical: 10.w,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
              ),
              SizedBox(height: 120.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(color: Colors.white),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(LoginScreen());
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.redAccent),
                    ),
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

// SizedBox(height: 40.h),
// TextFormField(
//   obscureText: isobscure,
//   controller: registerController.confirmClt,
//   style: TextStyle(
//     fontWeight: FontWeight.bold,
//     color: Colors.white,
//   ),
//   decoration: InputDecoration(
//     hintText: "Confirm your password",
//     labelText: "Confirm Password",
//     border: OutlineInputBorder(),
//     suffixIcon: IconButton(
//       onPressed: () {
//         setState(() {
//           isobscure = !isobscure;
//         });
//       },
//       icon: Icon(
//         isobscure
//             ? Icons.visibility_off_outlined
//             : Icons.visibility_outlined,
//       ),
//     ),
//   ),
// ),
