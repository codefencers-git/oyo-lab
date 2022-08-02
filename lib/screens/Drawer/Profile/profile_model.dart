// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators

import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
    ProfileModel({
        this.success,
        this.status,
        this.message,
        this.data,
    });

    String? success;
    String? status;
    String? message;
    ProfileData? data;

    factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        success: json["success"] == null ? null : json["success"],
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : ProfileData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "data": data == null ? null : data!.toJson(),
    };
}

class ProfileData {
    ProfileData({
        this.id,
        this.name,
        this.profileImage,
        this.email,
        this.countryCode,
        this.phoneNumber,
        this.gender,
        this.dob,
        this.userType,
        this.status,
    });

    String? id;
    String? name;
    String? profileImage;
    String? email;
    String? countryCode;
    String? phoneNumber;
    String? gender;
    String? dob;
    String? userType;
    String? status;

    factory ProfileData.fromJson(Map<String, dynamic> json) => ProfileData(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        profileImage: json["profile_image"] == null ? null : json["profile_image"],
        email: json["email"] == null ? null : json["email"],
        countryCode: json["country_code"] == null ? null : json["country_code"],
        phoneNumber: json["phone_number"] == null ? null : json["phone_number"],
        gender: json["gender"] == null ? null : json["gender"],
        dob: json["dob"] == null ? null : json["dob"],
        userType: json["user_type"] == null ? null : json["user_type"],
        status: json["status"] == null ? null : json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "profile_image": profileImage == null ? null : profileImage,
        "email": email == null ? null : email,
        "country_code": countryCode == null ? null : countryCode,
        "phone_number": phoneNumber == null ? null : phoneNumber,
        "gender": gender == null ? null : gender,
        "dob":dob == null ? null : dob,
        "user_type": userType == null ? null : userType,
        "status": status == null ? null : status,
    };
}
