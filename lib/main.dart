import 'package:final_project/onboarding_screen/wellcome_screen_onboarding.dart';
import 'package:final_project/profile_screen_and_edit_oftion/profile_screen.dart';
import 'package:final_project/update_password/update_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(home: child);
      },
      child: const WellcomeScreenOnboarding(),
      //  child: const ProfileScreen(),
    );
  }
}
