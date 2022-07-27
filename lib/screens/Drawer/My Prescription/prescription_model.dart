// To parse this JSON data, do
//
//     final prescriptionModel = prescriptionModelFromJson(jsonString);

import 'dart:convert';

PrescriptionModel prescriptionModelFromJson(String str) =>
    PrescriptionModel.fromJson(json.decode(str));

String prescriptionModelToJson(PrescriptionModel data) =>
    json.encode(data.toJson());

class PrescriptionModel {
  PrescriptionModel({
    this.success,
    this.status,
    this.message,
    this.data,
  });

  String? success;
  String? status;
  String? message;
  List<PrescriptionData>? data;

  factory PrescriptionModel.fromJson(Map<String, dynamic> json) =>
      PrescriptionModel(
        success: json["success"] == null ? null : json["success"],
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null
            ? null
            : List<PrescriptionData>.from(
                json["data"].map((x) => PrescriptionData.fromJson(x))),
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

class PrescriptionData {
  PrescriptionData({
    this.id,
    this.title,
    this.prescription,
    this.type,
    this.date,
  });

  String? id;
  String? title;
  List<String>? prescription;
  String? type;
  DateTime? date;

  factory PrescriptionData.fromJson(Map<String, dynamic> json) =>
      PrescriptionData(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        prescription: json["prescription"] == null
            ? null
            : List<String>.from(json["prescription"].map((x) => x)),
        type: json["type"] == null ? null : json["type"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "prescription": prescription == null
            ? null
            : List<dynamic>.from(prescription!.map((x) => x)),
        "type": type == null ? null : type,
        "date": date == null ? null : date!.toIso8601String(),
      };
}
