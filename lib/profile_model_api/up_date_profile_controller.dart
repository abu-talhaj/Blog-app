import 'dart:convert';
import 'package:final_project/login_register_logout_change_password_api/token_manager.dart';
import 'package:final_project/profile_model_api/profile_controller.dart';
import 'package:final_project/profile_model_api/up_date_profile_model.dart';
import 'package:final_project/profile_model_api/up_date_profile_service.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class UpDateProfileController extends GetxController {
  final UpDateProfileService upDateProfileService = UpDateProfileService();
  RxBool isLoading = false.obs;
  Rx<UpDateProfileModel?> profiles = Rx<UpDateProfileModel?>(null);

  Future<void> putProfile(Map<String, dynamic> body) async {
    try {
      isLoading.value = true;
      String? token = await TokenManager().getToken();
      if (token == null) return;

      final response = await upDateProfileService.UpdateProfile(token, body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        profiles.value = UpDateProfileModel.fromJson(jsonDecode(response.body));

        final profileController = Get.find<ProfileController>();
        await profileController.loadProfile();
        Get.back();
      }else{
        Get.snackbar("Error", "Profile is not update");
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }
}
