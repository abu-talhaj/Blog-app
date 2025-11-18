import 'package:http/http.dart' as http;

class LikeApiService {
  Future<http.Response> likePost(int postId, String token) async {
    String url = "https://api.zhndev.site/wp-json/blog-app/v1/posts/128/like";
    http.Response response = await http.post(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );
    return response;
  }
}
