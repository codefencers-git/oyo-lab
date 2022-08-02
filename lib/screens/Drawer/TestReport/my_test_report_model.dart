// To parse this JSON data, do
//     final myTestReportModel = myTestReportModelFromJson(jsonString);
// ignore_for_file: prefer_if_null_operators

import 'dart:convert';

MyTestReportModel myTestReportModelFromJson(String str) =>
    MyTestReportModel.fromJson(json.decode(str));

String myTestReportModelToJson(MyTestReportModel data) =>
    json.encode(data.toJson());

class MyTestReportModel {
  MyTestReportModel({
    this.success,
    this.status,
    this.message,
    this.data,
  });

  String? success;
  String? status;
  String? message;
  List<TestReportDetails>? data;

  factory MyTestReportModel.fromJson(Map<String, dynamic> json) =>
      MyTestReportModel(
        success: json["success"] == null ? null : json["success"],
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null
            ? null
            : List<TestReportDetails>.from(
                json["data"].map((x) => TestReportDetails.fromJson(x))),
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

class TestReportDetails {
  TestReportDetails({
    this.id,
    this.report,
    this.testName,
    this.labName,
    this.date,
  });

  String? id;
  String? report;
  String? testName;
  String? labName;
  DateTime? date;

  factory TestReportDetails.fromJson(Map<String, dynamic> json) =>
      TestReportDetails(
        id: json["id"] == null ? null : json["id"],
        report: json["report"] == null ? null : json["report"],
        testName: json["test_name"] == null ? null : json["test_name"],
        labName: json["lab_name"] == null ? null : json["lab_name"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "report": report == null ? null : report,
        "test_name": testName == null ? null : testName,
        "lab_name": labName == null ? null : labName,
        "date": date == null ? null : date!.toIso8601String(),
      };
}
