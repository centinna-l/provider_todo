import 'dart:convert';

Map<String, Welcome> FetchingDataFromJson(String str) => Map.from(json.decode(str)).map((k, v) => MapEntry<String, Welcome>(k, Welcome.fromJson(v)));

String welcomeToJson(Map<String, Welcome> data) => json.encode(Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())));

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
