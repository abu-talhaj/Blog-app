import 'dart:convert';
import 'package:final_project/login_register_logout_change_password_api/token_manager.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'comment_model.dart';

class CommentService extends GetxService {
  final String baseUrl = "https://api.zhndev.site/wp-json/blog-app/v1";
  final TokenManager tokenManager = TokenManager();

  // FETCH COMMENTS
  Future<List<CommentModel>> fetchComments(int postId) async {
    try {
      final response = await tokenManager.getRequest("$baseUrl/comments/post/$postId");
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        final list = body["data"]["comments"] as List;
        return list.map((e) => CommentModel.fromJson(e)).toList();
      }
      return [];
    } catch (e) {
      print("FETCH COMMENTS ERROR: $e");
      return [];
    }
  }

  // ADD COMMENT
  Future<bool> addComment(int postId, String text) async {
    try {
      final response = await tokenManager.postRequest("$baseUrl/comments", {
        "post_id": postId,
        "content": text,
        "parent_id": 0,
      });
      return response.statusCode == 201;
    } catch (e) {
      print("ADD COMMENT ERROR: $e");
      return false;
    }
  }
}
