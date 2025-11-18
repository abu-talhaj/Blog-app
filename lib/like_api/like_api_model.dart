// To parse this JSON data, do
//
//     final likeModel = likeModelFromJson(jsonString);

import 'dart:convert';

LikeModel likeModelFromJson(String str) => LikeModel.fromJson(json.decode(str));

String likeModelToJson(LikeModel data) => json.encode(data.toJson());

class LikeModel {
  bool success;
  String message;
  Data data;

  LikeModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory LikeModel.fromJson(Map<String, dynamic> json) => LikeModel(
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
  bool liked;
  String likeCount;

  Data({
    required this.postId,
    required this.liked,
    required this.likeCount,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    postId: json["post_id"],
    liked: json["liked"],
    likeCount: json["like_count"],
  );

  Map<String, dynamic> toJson() => {
    "post_id": postId,
    "liked": liked,
    "like_count": likeCount,
  };
}
