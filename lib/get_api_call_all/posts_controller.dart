import 'dart:convert';

import 'package:final_project/blog_home_screen/posts_model.dart';
import 'package:final_project/get_api_call_all/get_api_service.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PostsController extends GetxController {
  RxBool isLoading = false.obs;

  PostsService postsService = PostsService();
  RxList<Post> postsList = <Post>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    factchPosts();
  }

  void factchPosts() async {
    try {
      isLoading(true);

      http.Response response = await postsService.getPosts();

      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = jsonDecode(response.body);
        List posts = data["data"]["posts"];
        postsList.value = posts.map((e) => Post.fromJson(e)).toList();
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }
}
