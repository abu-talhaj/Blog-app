import 'dart:convert';

import 'package:http/http.dart' as http;

class LogoutService {
  Future<http.Response> postlogout(Map<String, dynamic> object) async {
    String url = "https://api.zhndev.site/wp-json/blog-app/v1/auth/logout";
    http.Response response = await http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(object),
    );
    return response;
  }
}
