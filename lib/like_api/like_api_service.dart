import 'dart:convert';
import 'package:final_project/login_register_logout_change_password_api/token_manager.dart';
import 'package:http/http.dart' as http;

class LikeService {
  final TokenManager _tokenManager = TokenManager();

  Future<Map<String, dynamic>> fetchLikes(int postId) async {
    final url =
        "https://api.zhndev.site/wp-json/blog-app/v1/posts/$postId/like";

    try {
      final response = await _tokenManager.getRequest(url);

      print("LIKE FETCH STATUS: ${response.statusCode}");
      print("LIKE FETCH BODY: ${response.body}");

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        return {
          "count": data["data"]["like_count"] ?? 0,
          "liked": data["data"]["liked"] ?? false,
        };
      }

      return {"count": 0, "liked": false};
    } catch (e) {
      print("FETCH LIKE ERROR: $e");
      return {"count": 0, "liked": false};
    }
  }

  Future<bool> toggleLike(int postId) async {
    final url =
        "https://api.zhndev.site/wp-json/blog-app/v1/posts/$postId/like";

    try {
      final response = await _tokenManager.postRequest(url, {});

      print("TOGGLE LIKE STATUS: ${response.statusCode}");
      print("TOGGLE LIKE BODY: ${response.body}");

      return response.statusCode == 200;
    } catch (e) {
      print("TOGGLE LIKE ERROR: $e");
      return false;
    }
  }
}
