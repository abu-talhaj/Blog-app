import 'package:http/http.dart' as http;

class UserLikedService {
  Future<http.Response> likePost(int postId, String token) async {
    String url = "https://api.zhndev.site/wp-json/blog-app/v1/user/likes";
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
