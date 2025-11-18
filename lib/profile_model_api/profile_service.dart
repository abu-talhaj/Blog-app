//
// import 'package:http/http.dart' as http;
//
// class ProfileService {
//   Future<http.Response> getProfile(String token) async {
//     String url = "https://api.zhndev.site/wp-json/blog-app/v1/user/profile";
//
//     http.Response response = await http.get(
//       Uri.parse(url),
//       headers: {
//         "Content-Type": "application/json",
//         "Authorization": "Bearer $token",
//       },
//     );
//     return response;
//   }
// }


import 'package:http/http.dart' as http;
import 'package:final_project/login_register_logout_change_password_api/token_manager.dart';

class ProfileService {
  Future<http.Response> getProfile() async {
    const url = "https://api.zhndev.site/wp-json/blog-app/v1/user/profile";
    return await TokenManager().getRequest(url);
  }
}
