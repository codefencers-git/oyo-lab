// To parse this JSON data, do
//
//     final appointmentHistoryModel = appointmentHistoryModelFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators

import 'dart:convert';

AppointmentHistoryModel appointmentHistoryModelFromJson(String str) =>
    AppointmentHistoryModel.fromJson(json.decode(str));

String appointmentHistoryModelToJson(AppointmentHistoryModel data) =>
    json.encode(data.toJson());

class AppointmentHistoryModel {
  AppointmentHistoryModel({
    this.success,
    this.status,
    this.message,
    this.data,
  });

  String? success;
  String? status;
  String? message;
  AppointmentDetails? data;

  factory AppointmentHistoryModel.fromJson(Map<String, dynamic> json) =>
      AppointmentHistoryModel(
        success: json["success"] == null ? null : json["success"],
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null
            ? null
            : AppointmentDetails.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "data": data == null ? null : data!.toJson(),
      };
}

class AppointmentDetails {
  AppointmentDetails({
    this.id,
    this.itemId,
    this.price,
    this.itemTotal,
    this.grandTotal,
    this.bookingFor,
    this.memberId,
    this.laboratory,
    this.labId,
    this.labAddress,
    this.rating,
    this.totalRate,
    this.testName,
    this.testType,
    this.userName,
    this.userNumber,
    this.userImage,
    this.status,
  });

  String? id;
  String? itemId;
  String? price;
  String? itemTotal;
  String? grandTotal;
  String? bookingFor;
  String? memberId;
  String? laboratory;
  String? labId;
  String? labAddress;
  String? rating;
  String? totalRate;
  String? testName;
  String? testType;
  String? userName;
  String? userNumber;
  String? userImage;
  String? status;

  factory AppointmentDetails.fromJson(Map<String, dynamic> json) =>
      AppointmentDetails(
        id: json["id"] == null ? null : json["id"],
        itemId: json["item_id"] == null ? null : json["item_id"],
        price: json["price"] == null ? null : json["price"],
        itemTotal: json["item_total"] == null ? null : json["item_total"],
        grandTotal: json["grand_total"] == null ? null : json["grand_total"],
        bookingFor: json["booking_for"] == null ? null : json["booking_for"],
        memberId: json["member_id"] == null ? null : json["member_id"],
        laboratory: json["laboratory"] == null ? null : json["laboratory"],
        labId: json["lab_id"] == null ? null : json["lab_id"],
        labAddress: json["lab_address"] == null ? null : json["lab_address"],
        rating: json["rating"] == null ? null : json["rating"],
        totalRate: json["total_rate"] == null ? null : json["total_rate"],
        testName: json["test_name"] == null ? null : json["test_name"],
        testType: json["test_type"] == null ? null : json["test_type"],
        userName: json["user_name"] == null ? null : json["user_name"],
        userNumber: json["user_number"] == null ? null : json["user_number"],
        userImage: json["user_image"] == null ? null : json["user_image"],
        status: json["status"] == null ? null : json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "item_id": itemId == null ? null : itemId,
        "price": price == null ? null : price,
        "item_total": itemTotal == null ? null : itemTotal,
        "grand_total": grandTotal == null ? null : grandTotal,
        "booking_for": bookingFor == null ? null : bookingFor,
        "member_id": memberId == null ? null : memberId,
        "laboratory": laboratory == null ? null : laboratory,
        "lab_id": labId == null ? null : labId,
        "lab_address": labAddress == null ? null : labAddress,
        "rating": rating == null ? null : rating,
        "total_rate": totalRate == null ? null : totalRate,
        "test_name": testName == null ? null : testName,
        "test_type": testType == null ? null : testType,
        "user_name": userName == null ? null : userName,
        "user_number": userNumber == null ? null : userNumber,
        "user_image": userImage == null ? null : userImage,
        "status": status == null ? null : status,
      };
}
