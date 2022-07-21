// To parse this JSON data, do
//
//     final memberModel = memberModelFromJson(jsonString);

// ignore_for_file: unnecessary_null_comparison, prefer_if_null_operators

import 'dart:convert';

MemberModel memberModelFromJson(String str) =>
    MemberModel.fromJson(json.decode(str));

String memberModelToJson(MemberModel data) => json.encode(data.toJson());

class MemberModel {
  MemberModel({
    this.success,
    this.status,
    this.message,
    this.data,
  });

  String? success;
  String? status;
  String? message;
  List<MemberData>? data;

  factory MemberModel.fromJson(Map<String, dynamic> json) => MemberModel(
        success: json["success"] == null ? null : json["success"],
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null
            ? null
            : List<MemberData>.from(
                json["data"].map((x) => MemberData.fromJson(x))),
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

class MemberData {
  MemberData({
    this.id,
    this.profileImage,
    this.name,
    this.relation,
    this.email,
    this.countryCode,
    this.phoneNumber,
    this.activity,
    this.dob,
    this.age,
    this.height,
    this.weight,
  });

  String? id;
  String? profileImage;
  String? name;
  String? relation;
  String? email;
  String? countryCode;
  String? phoneNumber;
  String? activity;
  DateTime? dob;
  String? age;
  String? height;
  String? weight;

  factory MemberData.fromJson(Map<String, dynamic> json) => MemberData(
        id: json["id"] == null ? null : json["id"],
        profileImage:
            json["profile_image"] == null ? null : json["profile_image"],
        name: json["name"] == null ? null : json["name"],
        relation: json["relation"] == null ? null : json["relation"],
        email: json["email"] == null ? null : json["email"],
        countryCode: json["country_code"] == null ? null : json["country_code"],
        phoneNumber: json["phone_number"] == null ? null : json["phone_number"],
        activity: json["activity"] == null ? null : json["activity"],
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
        age: json["age"] == null ? null : json["age"],
        height: json["height"] == null ? null : json["height"],
        weight: json["weight"] == null ? null : json["weight"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "profile_image": profileImage == null ? null : profileImage,
        "name": name == null ? null : name,
        "relation": relation == null ? null : relation,
        "email": email == null ? null : email,
        "country_code": countryCode == null ? null : countryCode,
        "phone_number": phoneNumber == null ? null : phoneNumber,
        "activity": activity == null ? null : activity,
        "dob": dob == null
            ? null
            : "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}",
        "age": age == null ? null : age,
        "height": height == null ? null : height,
        "weight": weight == null ? null : weight,
      };
}
