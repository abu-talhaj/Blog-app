import 'package:final_project/comment_api_model/comment_api_service.dart';
import 'package:get/get.dart';
import 'comment_model.dart';

class CommentController extends GetxController {
  final CommentService service = Get.put(CommentService());
  RxBool isLoading = false.obs;
  RxList<CommentModel> comments = <CommentModel>[].obs;

  Future<void> loadComments(int postId) async {
    try {
      isLoading.value = true;
      final result = await service.fetchComments(postId);
      comments.assignAll(result);
    } finally {
      isLoading.value = false;
    }
  }

  Future<bool> addNewComment(int postId, String text) async {
    final success = await service.addComment(postId, text);
    if (success) await loadComments(postId);
    return success;
  }
}
