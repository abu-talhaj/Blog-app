import 'package:http/http.dart' as http;
import 'dart:convert';


class CommentApiService {
  Future<http.Response> postcomment(Map<String, dynamic> object) async {
    String url = "https://api.zhndev.site/wp-json/blog-app/v1/comments";
    http.Response response = await http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(object),
    );
    return response;
  }
}