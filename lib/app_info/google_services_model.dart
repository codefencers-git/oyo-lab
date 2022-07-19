// To parse this JSON data, do
//
//     final googleServicesModel = googleServicesModelFromJson(jsonString);

import 'dart:convert';

GoogleServicesModel googleServicesModelFromJson(String str) =>
    GoogleServicesModel.fromJson(json.decode(str));

String googleServicesModelToJson(GoogleServicesModel data) =>
    json.encode(data.toJson());

class GoogleServicesModel {
  GoogleServicesModel({
    this.success,
    this.status,
    this.message,
    this.data,
  });

  String? success;
  String? status;
  String? message;
  Data? data;

  factory GoogleServicesModel.fromJson(Map<String, dynamic> json) =>
      GoogleServicesModel(
        success: json["success"] == null ? null : json["success"],
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "data": data == null ? null : data!.toJson(),
      };
}

class Data {
  Data({
    this.title,
    this.contactNo,
    this.contactEmail,
    this.appVersion,
    this.fcmServerKey,
    this.googleMapApiKey,
    this.copyRightsYear,
    this.xdMobile,
  });

  String? title;
  String? contactNo;
  String? contactEmail;
  String? appVersion;
  String? fcmServerKey;
  String? googleMapApiKey;
  String? copyRightsYear;
  String? xdMobile;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        title: json["title"] == null ? null : json["title"],
        contactNo: json["contact_no"] == null ? null : json["contact_no"],
        contactEmail:
            json["contact_email"] == null ? null : json["contact_email"],
        appVersion: json["app_version"] == null ? null : json["app_version"],
        fcmServerKey:
            json["fcm_server_key"] == null ? null : json["fcm_server_key"],
        googleMapApiKey: json["google_map_api_key"] == null
            ? null
            : json["google_map_api_key"],
        copyRightsYear:
            json["copy_rights_year"] == null ? null : json["copy_rights_year"],
        xdMobile: json["xd_mobile"] == null ? null : json["xd_mobile"],
      );

  Map<String, dynamic> toJson() => {
        "title": title == null ? null : title,
        "contact_no": contactNo == null ? null : contactNo,
        "contact_email": contactEmail == null ? null : contactEmail,
        "app_version": appVersion == null ? null : appVersion,
        "fcm_server_key": fcmServerKey == null ? null : fcmServerKey,
        "google_map_api_key": googleMapApiKey == null ? null : googleMapApiKey,
        "copy_rights_year": copyRightsYear == null ? null : copyRightsYear,
        "xd_mobile": xdMobile == null ? null : xdMobile,
      };
}
