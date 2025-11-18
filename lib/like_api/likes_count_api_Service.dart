import 'package:http/http.dart' as http;

class LikesCountService {
  Future<http.Response> likePost(int postId, String token) async {
    String url = "https://api.zhndev.site/wp-json/blog-app/v1/posts/128/likes";
    http.Response response = await http.post(Uri.parse(url));
    return response;
  }
}
