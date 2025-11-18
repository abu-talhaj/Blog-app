import 'dart:convert';

import 'package:http/http.dart' as http;

class UpDateProfileService {
  Future<http.Response> UpdateProfile(
    String token,
    Map<String, dynamic> body,
  ) async {
    final url = "https://api.zhndev.site/wp-json/blog-app/v1/user/profile";

    http.Response response = await http.put(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
      body: jsonEncode(body),
    );
    return response;
  }
}
