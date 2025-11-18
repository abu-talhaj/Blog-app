import 'dart:convert';
import 'package:final_project/all_my_blog_app_screen/login_screen.dart';
import 'package:final_project/login_register_logout_change_password_api/token_manager.dart';
import 'package:final_project/login_register_logout_change_password_api/register_service.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ChangePasswordController extends GetxController {
  final ChangePassword changePassword = ChangePassword();
  RxBool isLoading = false.obs;

  Future<void> UpDatePassword(
    String currentpassword,
    String newpassword,
    String confirmPassword,
  ) async {
    isLoading.value = true;

    Map<String, dynamic> body = {
      "current_password": currentpassword,
      "new_password": newpassword,
      "confirm_password": confirmPassword,
    };

    try {
      final url = "https://api.zhndev.site/wp-json/blog-app/v1/user/change-password";
      final response = await TokenManager().postRequest(url, body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = jsonDecode(response.body);

        if (data["success"] == true) {
          Get.snackbar("_", "Password updated successfully");

          Get.offAll(() => LoginScreen());
        } else {
          Get.snackbar("_", "Worng");
        }
      } else {
        isLoading.value = false;
        Get.snackbar("_", "Error");
      }
    } catch (e) {
      isLoading.value = false;
      print(e);
    }
  }
}
