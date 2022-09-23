// To parse this JSON data, do
//
//     final apiRepo = apiRepoFromJson(jsonString);

import 'dart:convert';

ApiRepoModel apiRepoFromJson(String str) => ApiRepoModel.fromJson(json.decode(str));

String apiRepoToJson(ApiRepoModel data) => json.encode(data.toJson());

class ApiRepoModel {
    ApiRepoModel({
        this.userId,
        this.id,
        this.title,
        this.body,
    });

    int? userId;
    int? id;
    String? title;
    String? body;

    factory ApiRepoModel.fromJson(Map<String, dynamic> json) => ApiRepoModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
    };
}
