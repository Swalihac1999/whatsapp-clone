// To parse this JSON data, do
//
//     final userStatus = userStatusFromJson(jsonString);

import 'dart:convert';

UserStatus userStatusFromJson(String str) =>
    UserStatus.fromJson(json.decode(str));

String userStatusToJson(UserStatus data) => json.encode(data.toJson());

class UserStatus {
  UserStatus({
    this.name,
    this.status,
    this.image,
    this.updatedAt,
  });

  String? name;
  String? status;
  String? image;
  String? updatedAt;

  factory UserStatus.fromJson(Map<String, dynamic> json) => UserStatus(
        name: json["name"],
        status: json["status"],
        image: json["image"],
        updatedAt: json["updatedAt"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "status": status,
        "image": image,
        "updatedAt": updatedAt,
      };
}
