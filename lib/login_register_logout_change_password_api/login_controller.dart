import 'package:final_project/all_my_blog_app_screen/bottom_nav_bar_screen.dart';
import 'package:final_project/login_register_logout_change_password_api/login_model.dart';
import 'package:final_project/login_register_logout_change_password_api/register_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  TextEditingController emailClt = TextEditingController();
  TextEditingController passwordClt = TextEditingController();

  LoginService loginService = LoginService();

  var loginResponse = Rxn<LoginModel>();
  var isLoading = false.obs;

  Future<void> login() async {
    if (emailClt.text.isEmpty || passwordClt.text.isEmpty) {
      Get.snackbar("Error", "Email and password not same");
      return;
    }

    Future<void> saveToken(String token)async{
     SharedPreferences sharedPreferences= await
     SharedPreferences.getInstance();
     await sharedPreferences.setString("token", token);


    }



    isLoading.value = true;
    Map<String, dynamic> logins = {
      "email": emailClt.text,
      "password": passwordClt.text,
    };

    try {
      final response = await loginService.postlogin(logins);

      if (response.statusCode == 200 || response.statusCode == 201) {
        loginResponse.value = loginModelFromJson(response.body);



        if(loginResponse.value?.data?.token!=null){
          await saveToken(loginResponse.value!.data!.token!);
        }



        Get.snackbar(" Success ", "Login Successfully");
        Get.off(() => BottomNavBarScreen());
      } else {
        Get.snackbar("_", "Login failed");
      }
    } catch (e) {
      Get.snackbar("Something went wrong", "$e");
    } finally {
      isLoading.value = false;
    }
  }
}
