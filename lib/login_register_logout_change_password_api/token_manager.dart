import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class TokenManager {
  static final TokenManager _instance = TokenManager._internal();
  factory TokenManager() => _instance;
  TokenManager._internal();


  // Token get / save

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("token");
  }

  Future<String?> getRefreshToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("refreshToken");
  }

  Future<void> saveToken(String token, String refreshToken) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("token", token);
    await prefs.setString("refreshToken", refreshToken);
  }

  Future<void> saveOnlyAccessToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("token", token);
  }


  //   GET REQUEST WITH AUTO TOKEN REFRESH

  Future<http.Response> getRequest(String url) async {
    String? token = await getToken();

    http.Response response = await http.get(
      Uri.parse(url),
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      },
    );

    if (response.statusCode == 401) {
      bool refreshed = await refreshToken();

      if (refreshed) {
        token = await getToken();
        response = await http.get(
          Uri.parse(url),
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "application/json",
          },
        );
      }
    }
    return response;
  }


  //     POST REQUEST WITH AUTO TOKEN REFRESH

  Future<http.Response> postRequest(String url, Map<String, dynamic> body) async {
    String? token = await getToken();

    http.Response response = await http.post(
      Uri.parse(url),
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      },
      body: jsonEncode(body),
    );

    if (response.statusCode == 401) {
      bool refreshed = await refreshToken();

      if (refreshed) {
        token = await getToken();
        response = await http.post(
          Uri.parse(url),
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "application/json",
          },
          body: jsonEncode(body),
        );
      }
    }
    return response;
  }

  //  REFRESH TOKEN LOGIC

  Future<bool> refreshToken() async {
    final prefs = await SharedPreferences.getInstance();
    final refreshToken = prefs.getString("refreshToken");

    if (refreshToken == null) return false;

    const url = "https://api.zhndev.site/wp-json/blog-app/v1/auth/refresh-token";

    final response = await http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"refresh_token": refreshToken}),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = jsonDecode(response.body);
      String newToken = data["data"]["token"];

      await saveOnlyAccessToken(newToken);
      return true;
    }
    return false;
  }
}
