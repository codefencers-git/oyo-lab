// To parse this JSON data, do
//
//     final faQsModel = faQsModelFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators

import 'dart:convert';

FAQsModel faQsModelFromJson(String str) => FAQsModel.fromJson(json.decode(str));

String faQsModelToJson(FAQsModel data) => json.encode(data.toJson());

class FAQsModel {
  FAQsModel({
    this.success,
    this.status,
    this.message,
    this.data,
  });

  String? success;
  String? status;
  String? message;
  List<FAQsData>? data;

  factory FAQsModel.fromJson(Map<String, dynamic> json) => FAQsModel(
        success: json["success"] == null ? null : json["success"],
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null
            ? null
            : List<FAQsData>.from(json["data"].map((x) => FAQsData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class FAQsData {
  FAQsData({
    this.id,
    this.title,
    this.list,
  });

  String? id;
  String? title;
  List<ListElement>? list;

  factory FAQsData.fromJson(Map<String, dynamic> json) => FAQsData(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        list: json["list"] == null
            ? null
            : List<ListElement>.from(
                json["list"].map((x) => ListElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "list": list == null
            ? null
            : List<dynamic>.from(list!.map((x) => x.toJson())),
      };
}

class ListElement {
  ListElement({
    this.id,
    this.title,
    this.description,
  });

  String? id;
  String? title;
  String? description;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        description: json["description"] == null ? null : json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "description": description == null ? null : description,
      };
}
