// To parse this JSON data, do
//
//     final userLikedModel = userLikedModelFromJson(jsonString);

import 'dart:convert';

UserLikedModel userLikedModelFromJson(String str) =>
    UserLikedModel.fromJson(json.decode(str));

String userLikedModelToJson(UserLikedModel data) => json.encode(data.toJson());

class UserLikedModel {
  bool success;
  String message;
  Data data;

  UserLikedModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory UserLikedModel.fromJson(Map<String, dynamic> json) => UserLikedModel(
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
  List<dynamic> posts;
  Pagination pagination;

  Data({required this.posts, required this.pagination});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    posts: List<dynamic>.from(json["posts"].map((x) => x)),
    pagination: Pagination.fromJson(json["pagination"]),
  );

  Map<String, dynamic> toJson() => {
    "posts": List<dynamic>.from(posts.map((x) => x)),
    "pagination": pagination.toJson(),
  };
}

class Pagination {
  int currentPage;
  int perPage;
  String totalLikes;
  int totalPages;

  Pagination({
    required this.currentPage,
    required this.perPage,
    required this.totalLikes,
    required this.totalPages,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    currentPage: json["current_page"],
    perPage: json["per_page"],
    totalLikes: json["total_likes"],
    totalPages: json["total_pages"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "per_page": perPage,
    "total_likes": totalLikes,
    "total_pages": totalPages,
  };
}
