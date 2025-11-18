// To parse this JSON data, do
//
//     final refreshModel = refreshModelFromJson(jsonString);

import 'dart:convert';

RefreshModel refreshModelFromJson(String str) => RefreshModel.fromJson(json.decode(str));

String refreshModelToJson(RefreshModel data) => json.encode(data.toJson());

class RefreshModel {
  bool success;
  String message;
  Data data;

  RefreshModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory RefreshModel.fromJson(Map<String, dynamic> json) => RefreshModel(
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
  String token;
  String tokenType;
  int expiresIn;

  Data({
    required this.token,
    required this.tokenType,
    required this.expiresIn,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    token: json["token"],
    tokenType: json["token_type"],
    expiresIn: json["expires_in"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "token_type": tokenType,
    "expires_in": expiresIn,
  };
}
