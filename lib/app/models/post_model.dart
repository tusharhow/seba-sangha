// To parse this JSON data, do
//
//     final postModel = postModelFromJson(jsonString);

import 'dart:convert';

List<PostModel> postModelFromJson(String str) => List<PostModel>.from(json.decode(str).map((x) => PostModel.fromJson(x)));

String postModelToJson(List<PostModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostModel {
    PostModel({
      required  this.title,
      required  this.body,
      required  this.amount,
      required  this.paymentMethod,
      required  this.userId,
    });

    String? title;
    String ?body;
    String ?amount;
    String ?paymentMethod;
    String ?userId;

    factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        title: json["title"],
        body: json["body"],
        amount: json["amount"],
        paymentMethod: json["paymentMethod"].toString(),
        userId: json["userID"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "body": body,
        "amount": amount,
        "paymentMethod": paymentMethod.toString(),
        "userID": userId,
    };
}
