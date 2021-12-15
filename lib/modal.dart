// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    this.status,
    this.title,
    this.userId,
  });

  bool status;
  String title;
  String userId;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    status: json["status"],
    title: json["title"],
    userId: json["userId"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "title": title,
    "userId": userId,
  };
}
