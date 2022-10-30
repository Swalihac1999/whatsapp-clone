// To parse this JSON data, do
//
//     final singleChatModl = singleChatModlFromJson(jsonString);

import 'dart:convert';

SingleChatModl singleChatModlFromJson(String str) =>
    SingleChatModl.fromJson(json.decode(str));

String singleChatModlToJson(SingleChatModl data) => json.encode(data.toJson());

class SingleChatModl {
  SingleChatModl({
    this.isSent,
    this.isReaded,
    this.message,
    this.sentAt,
    this.price,
  });

  bool? isSent;
  bool? isReaded;
  String? message;
  String? sentAt;
  String? price;

  factory SingleChatModl.fromJson(Map<String, dynamic> json) => SingleChatModl(
        isSent: json["is_sent"],
        isReaded: json["is_readed"],
        message: json["message"],
        sentAt: json["sentAt"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "is_sent": isSent,
        "is_readed": isReaded,
        "message": message,
        "sentAt": sentAt,
        "price": price,
      };
}
