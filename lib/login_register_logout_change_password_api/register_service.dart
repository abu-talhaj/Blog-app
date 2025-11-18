import 'dart:convert';

import 'package:http/http.dart' as http;

class RegisterService {
  Future<http.Response> postRegister(Map<String, dynamic> object) async {
    String url = "https://api.zhndev.site/wp-json/blog-app/v1/auth/register";
    http.Response response = await http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(object),
    );
    return response;
  }
}

class LoginService {
  Future<http.Response> postlogin(Map<String, dynamic> object) async {
    String url = "https://api.zhndev.site/wp-json/blog-app/v1/auth/login";
    http.Response response = await http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(object),
    );
    return response;
  }
}

// class LogoutService {
//   Future<http.Response> postlogout(Map<String, dynamic> object) async {
//     String url = "https://api.zhndev.site/wp-json/blog-app/v1/auth/logout";
//     http.Response response = await http.post(
//       Uri.parse(url),
//       headers: {"Content-Type": "application/json"},
//       body: jsonEncode(object),
//     );
//     return response;
//   }
// }

// class TokenRefresh {
//   Future<http.Response> postRefreshtoken(Map<String, dynamic> object) async {
//     String url =
//         "https://api.zhndev.site/wp-json/blog-app/v1/auth/refresh-token";
//     http.Response response = await http.post(
//       Uri.parse(url),
//       headers: {"Content-Type": "application/json"},
//       body: jsonEncode(object),
//     );
//     return response;
//   }
// }
class ChangePassword {
  Future<http.Response> postChangePassword(String token,Map<String, dynamic> body) async {
    String url =
        "https://api.zhndev.site/wp-json/blog-app/v1/user/change-password";
    http.Response response = await http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json",
        "Authorization": "Bearer $token",},
      body: jsonEncode(body),
    );
    return response;
  }
}
