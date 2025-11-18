import 'package:final_project/blog_home_screen/posts_model.dart';
import 'package:get/get.dart';

class FavouriteToggle extends GetxController {
  RxList<Post> bookmark = <Post>[].obs;

  void togglebookmark(Post post) {
    if (bookmark.contains(post)) {
      bookmark.remove(post);
    } else {
      bookmark.add(post);
    }
  }
  bool islove(Post post){
    return bookmark.contains(post);
  }
}
