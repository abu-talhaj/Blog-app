import 'package:final_project/like_api/like_api_service.dart';
import 'package:get/get.dart';

class LikeController extends GetxController {
  final LikeService likeService = LikeService();

  var likeCount = 0.obs;
  var isLiked = false.obs;
  var isLoading = false.obs;

  Future<void> loadLikes(int postId) async {
    isLoading.value = true;

    final data = await likeService.fetchLikes(postId);

    likeCount.value = data["count"];
    isLiked.value = data["liked"];

    isLoading.value = false;
  }

  Future<void> toggle(int postId) async {
    final success = await likeService.toggleLike(postId);

    if (success) {
      isLiked.value = !isLiked.value;
      likeCount.value += isLiked.value ? 1 : -1;
    }
  }
}
