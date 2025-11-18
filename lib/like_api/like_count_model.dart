// To parse this JSON data, do
//
//     final likeCountModel = likeCountModelFromJson(jsonString);

import 'dart:convert';

LikeCountModel likeCountModelFromJson(String str) => LikeCountModel.fromJson(json.decode(str));

String likeCountModelToJson(LikeCountModel data) => json.encode(data.toJson());

class LikeCountModel {
  bool success;
  String message;
  Data data;

  LikeCountModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory LikeCountModel.fromJson(Map<String, dynamic> json) => LikeCountModel(
    success: json["success"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  String postId;
  List<dynamic> likes;
  String totalLikes;
  Pagination pagination;

  Data({
    required this.postId,
    required this.likes,
    required this.totalLikes,
    required this.pagination,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    postId: json["post_id"],
    likes: List<dynamic>.from(json["likes"].map((x) => x)),
    totalLikes: json["total_likes"],
    pagination: Pagination.fromJson(json["pagination"]),
  );

  Map<String, dynamic> toJson() => {
    "post_id": postId,
    "likes": List<dynamic>.from(likes.map((x) => x)),
    "total_likes": totalLikes,
    "pagination": pagination.toJson(),
  };
}

class Pagination {
  int currentPage;
  int perPage;
  int totalPages;

  Pagination({
    required this.currentPage,
    required this.perPage,
    required this.totalPages,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    currentPage: json["current_page"],
    perPage: json["per_page"],
    totalPages: json["total_pages"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "per_page": perPage,
    "total_pages": totalPages,
  };
}
