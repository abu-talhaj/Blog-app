import 'dart:convert';
import 'package:get/get.dart';
import 'package:final_project/profile_model_api/profile_model.dart';
import 'package:final_project/profile_model_api/profile_service.dart';

class ProfileController extends GetxController {
  final ProfileService service = ProfileService();

  RxBool isLoading = false.obs;
  Rx<ProfileModel?> profile = Rx<ProfileModel?>(null);

  @override
  void onInit() {
    super.onInit();
    loadProfile();
  }

  Future<void> loadProfile() async {
    try {
      isLoading.value = true;

      final response = await service.getProfile();
      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        profile.value = profileModelFromJson(response.body);
      }
    } catch (e) {
      print("Profile error: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
