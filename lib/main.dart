import 'package:final_project/all_my_blog_app_screen/profile_screen.dart';
import 'package:final_project/all_my_blog_app_screen/wellcome_screen_onboarding.dart';
import 'package:final_project/book_marks_screen/favourite_toggle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(FavouriteToggle(),permanent: true);


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
        return GetMaterialApp(home: child);
      },
      child: const WellcomeScreenOnboarding(),
      //  child: const ProfileScreen(),
    );
  }
}
