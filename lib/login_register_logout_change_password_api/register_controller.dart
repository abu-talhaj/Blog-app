import 'package:final_project/all_my_blog_app_screen/login_screen.dart';
import 'package:final_project/login_register_logout_change_password_api/register_model.dart';
import 'package:final_project/login_register_logout_change_password_api/register_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


class RegisterController extends GetxController {
  TextEditingController usernameClt = TextEditingController();
  TextEditingController emailClt = TextEditingController();
  TextEditingController passwordClt = TextEditingController();
  TextEditingController phoneClt = TextEditingController();

  RegisterService registerService = RegisterService();

  var registerRespone = Rxn<RegisterModel>();
  var isLoading = false.obs;

  Future<void> register() async {
    if (usernameClt.text.isEmpty ||
        emailClt.text.isEmpty ||
        passwordClt.text.isEmpty ||
        phoneClt.text.isEmpty) {
      Get.snackbar("Error", " Place Complete your personal info  ");
      return;
    }

    Future<void>saveToken(String token)async{
      SharedPreferences sharedPreferences =
      await    SharedPreferences.getInstance();
      await sharedPreferences.setString("access_token", token);

    }

    isLoading.value = true;
    Map<String, dynamic> registers = {
      "name": usernameClt.text,
      "email": emailClt.text,
      "password": passwordClt.text,
      "phone":phoneClt.text,
    };

    try {
      final response = await registerService.postRegister(registers);

      if (response.statusCode == 200 || response.statusCode == 201) {
        registerRespone.value = registerModelFromJson(response.body);

        if(registerRespone.value?.data?.token!=null){
          await saveToken(registerRespone.value!.data!.token!);
        }

        Get.snackbar(" Success ", "Registration Successfully");
        Get.off(() => LoginScreen());
      } else {
        Get.snackbar("_", "Registration failed");
      }
    } catch (e) {
      Get.snackbar("Something went wrong", "$e");
    } finally {
      isLoading.value = false;
    }
  }
}


