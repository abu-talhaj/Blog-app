import 'package:http/http.dart' as http;

class PostsService{

  Future<http.Response> getPosts()async{

    String url="https://api.zhndev.site/wp-json/blog-app/v1/posts";

   http.Response response = await http.get(Uri.parse(url));
   return response;

  }

}