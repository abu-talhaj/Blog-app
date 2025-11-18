import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'like_api_service.dart';

class LikeApiController extends GetxController {
  LikeApiService likeApiService = LikeApiService();

  RxBool isLiked = false.obs;
  RxInt likesCount = 0.obs;

  Future<void> likes(int postId, String token) async {
    try {
      http.Response response = await likeApiService.likePost(postId, token);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = jsonDecode(response.body);
        isLiked.value = data["data"]["isLiked"];
        likesCount.value = data["data"]["likesCount"];
      }
    } catch (e) {
      print(e);
    }
  }
}
