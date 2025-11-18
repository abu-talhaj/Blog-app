// To parse this JSON data, do
//
//     final upDateProfileModel = upDateProfileModelFromJson(jsonString);

import 'dart:convert';

UpDateProfileModel upDateProfileModelFromJson(String str) => UpDateProfileModel.fromJson(json.decode(str));

String upDateProfileModelToJson(UpDateProfileModel data) => json.encode(data.toJson());

class UpDateProfileModel {
  bool success;
  String message;
  dynamic data;

  UpDateProfileModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory UpDateProfileModel.fromJson(Map<String, dynamic> json) => UpDateProfileModel(
    success: json["success"],
    message: json["message"],
    data: json["data"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data,
  };
}
