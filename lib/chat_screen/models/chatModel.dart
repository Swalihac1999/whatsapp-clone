// To parse this JSON data, do
//
//     final userDetails = userDetailsFromJson(jsonString);

import 'dart:convert';

UserDetails userDetailsFromJson(String str) =>
    UserDetails.fromJson(json.decode(str));

String userDetailsToJson(UserDetails data) => json.encode(data.toJson());

class UserDetails {
  UserDetails({
    this.name,
    this.message,
    this.image,
    this.isGroup,
    this.updatedAt,
  });

  String? name;
  String? message;
  String? image;
  bool? isGroup;
  String? updatedAt;

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        name: json["name"],
        message: json["Message"],
        image: json["image"],
        isGroup: json["isGroup"],
        updatedAt: json["updatedAt"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "Message": message,
        "image": image,
        "isGroup": isGroup,
        "updatedAt": updatedAt,
      };
}
