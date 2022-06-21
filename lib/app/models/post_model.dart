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
      required  this.paymentMethodNumber,
      required  this.userId,
      required  this.paymentMethod,
    });

    String? title;
    String ?body;
    String ?amount;
    String ?paymentMethodNumber;
    String ?userId;
    String ?paymentMethod;

    factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        title: json["title"],
        body: json["body"],
        amount: json["amount"],
        paymentMethodNumber: json["paymentMethodNumber"].toString(),
        userId: json["userID"],
        paymentMethod: json["paymentMethod"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "body": body,
        "amount": amount,
        "paymentMethodNumber": paymentMethodNumber.toString(),
        "userID": userId,
        "paymentMethod": paymentMethod,
    };
}
