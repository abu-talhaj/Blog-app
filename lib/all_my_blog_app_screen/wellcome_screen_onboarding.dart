import 'dart:async';

import 'package:final_project/all_my_blog_app_screen/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WellcomeScreenOnboarding extends StatefulWidget {
  const WellcomeScreenOnboarding({super.key});

  @override
  State<WellcomeScreenOnboarding> createState() =>
      _WellcomeScreenOnboardingState();
}

class _WellcomeScreenOnboardingState extends State<WellcomeScreenOnboarding> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnboardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      // body: SafeArea(
      //   child: Center(
      //     child: Text(
      //       "Welcome to my Blog Space",
      //       style: TextStyle(
      //         fontSize: 22.sp,
      //         fontWeight: FontWeight.bold,
      //         color: Colors.white,
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
