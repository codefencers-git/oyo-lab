// To parse this JSON data, do
//
//     final cmsData = cmsDataFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators

import 'dart:convert';

CmsModel cmsDataFromJson(String str) => CmsModel.fromJson(json.decode(str));

String cmsDataToJson(CmsModel data) => json.encode(data.toJson());

class CmsModel {
  CmsModel({
    this.success,
    this.status,
    this.message,
    this.data,
  });

  String? success;
  String? status;
  String? message;
  CmsPagesData? data;

  factory CmsModel.fromJson(Map<String, dynamic> json) => CmsModel(
        success: json["success"] == null ? null : json["success"],
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : CmsPagesData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "data": data == null ? null : data!.toJson(),
      };
}

class CmsPagesData {
  CmsPagesData({
    this.about,
    this.contact,
    this.terms,
    this.privacyPolicy,
  });

  String? about;
  String? contact;
  String? terms;
  String? privacyPolicy;

  factory CmsPagesData.fromJson(Map<String, dynamic> json) => CmsPagesData(
        about: json["about"] == null ? null : json["about"],
        contact: json["contact"] == null ? null : json["contact"],
        terms: json["terms"] == null ? null : json["terms"],
        privacyPolicy:
            json["privacy_policy"] == null ? null : json["privacy_policy"],
      );

  Map<String, dynamic> toJson() => {
        "about": about == null ? null : about,
        "contact": contact == null ? null : contact,
        "terms": terms == null ? null : terms,
        "privacy_policy": privacyPolicy == null ? null : privacyPolicy,
      };
}
