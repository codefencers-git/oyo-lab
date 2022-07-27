// To parse this JSON data, do
//
//     final bookAppointmentModel = bookAppointmentModelFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators

import 'dart:convert';

BookAppointmentModel bookAppointmentModelFromJson(String str) =>
    BookAppointmentModel.fromJson(json.decode(str));

String bookAppointmentModelToJson(BookAppointmentModel data) =>
    json.encode(data.toJson());

class BookAppointmentModel {
  BookAppointmentModel({
    this.success,
    this.status,
    this.message,
    this.data,
  });

  String? success;
  String? status;
  String? message;
  PaymentURL? data;

  factory BookAppointmentModel.fromJson(Map<String, dynamic> json) =>
      BookAppointmentModel(
        success: json["success"] == null ? null : json["success"],
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : PaymentURL.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "data": data == null ? null : data!.toJson(),
      };
}

class PaymentURL {
  PaymentURL({
    this.paymentUrl,
  });

  String? paymentUrl;

  factory PaymentURL.fromJson(Map<String, dynamic> json) => PaymentURL(
        paymentUrl: json["payment_url"] == null ? null : json["payment_url"],
      );

  Map<String, dynamic> toJson() => {
        "payment_url": paymentUrl == null ? null : paymentUrl,
      };
}
