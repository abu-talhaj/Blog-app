import 'dart:convert';
import 'package:final_project/all_my_blog_app_screen/onboarding_screen.dart';
import 'package:final_project/login_register_logout_change_password_api/logout_model.dart';
import 'package:final_project/login_register_logout_change_password_api/logout_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogoutController extends GetxController {
  final LogoutService logoutService = LogoutService();
  var isLoading = false.obs;

  Future<void> logout() async {
    try {
      isLoading.value = true;

      // Get stored token
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("token");
      if (token == null) {
        Get.snackbar("Error", "No token found");
        return;
      }

      // Call logout Api
      Map<String, dynamic> body = {"token": token};
      final response = await logoutService.postlogout(body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final logoutModel = logoutModelFromJson(response.body);

        if (logoutModel.success) {
          // Remove token
          await prefs.remove("token");
          await prefs.remove("refreshToken");


          // Get.offAll(() => OnboardingScreen());

        } else {
          Get.snackbar("Error", logoutModel.message);
        }
      } else {
        Get.snackbar("Error", "Logout failed");
      }
    } catch (e) {
      Get.snackbar("Error", "$e");
    } finally {
      isLoading.value = false;
    }
  }
}
