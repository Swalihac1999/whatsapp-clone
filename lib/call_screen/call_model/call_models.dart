// To parse this JSON data, do
//
//     final callusers = callusersFromJson(jsonString);

import 'dart:convert';

Callusers callusersFromJson(String str) => Callusers.fromJson(json.decode(str));

String callusersToJson(Callusers data) => json.encode(data.toJson());

class Callusers {
  Callusers({
    this.name,
    this.isGroup,
    this.image,
    this.updatedAt,
  });

  String? name;
  bool? isGroup;
  String? image;
  String? updatedAt;

  factory Callusers.fromJson(Map<String, dynamic> json) => Callusers(
        name: json["name"],
        isGroup: json["isGroup"],
        image: json["image"],
        updatedAt: json["updatedAt"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "isGroup": isGroup,
        "image": image,
        "updatedAt": updatedAt,
      };
}
