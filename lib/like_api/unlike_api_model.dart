// To parse this JSON data, do
//
//     final unlikeModel = unlikeModelFromJson(jsonString);

import 'dart:convert';

UnlikeModel unlikeModelFromJson(String str) => UnlikeModel.fromJson(json.decode(str));

String unlikeModelToJson(UnlikeModel data) => json.encode(data.toJson());

class UnlikeModel {
  bool success;
  String message;
  Data data;

  UnlikeModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory UnlikeModel.fromJson(Map<String, dynamic> json) => UnlikeModel(
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
