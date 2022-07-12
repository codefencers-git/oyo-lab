// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators

import 'dart:convert';

UserModel userModelFromJson(String str) =>
    UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.success,
    this.status,
    this.message,
    this.data,
  });

  String? success;
  String? status;
  String? message;
  UserData? data;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        success: json["success"] == null ? null : json["success"],
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : UserData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "data": data == null ? null : data!.toJson(),
      };
}

class UserData {
  UserData({
    this.token,
    this.id,
    this.profileImage,
    this.name,
    this.email,
    this.countryCode,
    this.phoneNumber,
    this.gender,
    this.dob,
    this.userType,
    this.status,
  });

  String? token;
  String? id;
  String? profileImage;
  String? name;
  String? email;
  String? countryCode;
  String? phoneNumber;
  String? gender;
  DateTime? dob;
  String? userType;
  String? status;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        token: json["token"] == null ? null : json["token"],
        id: json["id"] == null ? null : json["id"],
        profileImage:
            json["profile_image"] == null ? null : json["profile_image"],
        name: json["name"] == null ? null : json["name"],
        email: json["email"] == null ? null : json["email"],
        countryCode: json["country_code"] == null ? null : json["country_code"],
        phoneNumber: json["phone_number"] == null ? null : json["phone_number"],
        gender: json["gender"] == null ? null : json["gender"],
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
        userType: json["user_type"] == null ? null : json["user_type"],
        status: json["status"] == null ? null : json["status"],
      );

  Map<String, dynamic> toJson() => {
        "token": token == null ? null : token,
        "id": id == null ? null : id,
        "profile_image": profileImage == null ? null : profileImage,
        "name": name == null ? null : name,
        "email": email == null ? null : email,
        "country_code": countryCode == null ? null : countryCode,
        "phone_number": phoneNumber == null ? null : phoneNumber,
        "gender": gender == null ? null : gender,
        "dob": dob == null
            ? null
            : "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}",
        "user_type": userType == null ? null : userType,
        "status": status == null ? null : status,
      };
}
