// To parse this JSON data, do
//
//     final appointmentModel = appointmentModelFromJson(jsonString);

import 'dart:convert';

AppointmentModel appointmentModelFromJson(String str) =>
    AppointmentModel.fromJson(json.decode(str));

String appointmentModelToJson(AppointmentModel data) =>
    json.encode(data.toJson());

class AppointmentModel {
  AppointmentModel({
    this.success,
    this.status,
    this.message,
    this.data,
  });

  String? success;
  String? status;
  String? message;
  List<AppointmentData>? data;

  factory AppointmentModel.fromJson(Map<String, dynamic> json) =>
      AppointmentModel(
        success: json["success"] == null ? null : json["success"],
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null
            ? null
            : List<AppointmentData>.from(
                json["data"].map((x) => AppointmentData.fromJson(x))),
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

class AppointmentData {
  AppointmentData({
    this.id,
    this.orderStatus,
    this.customOrderId,
    this.bookingDate,
    this.bookingTime,
    this.price,
    this.labName,
    this.labImage,
  });

  String? id;
  String? orderStatus;
  String? customOrderId;
  String? bookingDate;
  String? bookingTime;
  String? price;
  String? labName;
  String? labImage;

  factory AppointmentData.fromJson(Map<String, dynamic> json) =>
      AppointmentData(
        id: json["id"] == null ? null : json["id"],
        orderStatus: json["order_status"] == null ? null : json["order_status"],
        customOrderId:
            json["custom_order_id"] == null ? null : json["custom_order_id"],
        bookingDate: json["booking_date"] == null ? null : json["booking_date"],
        bookingTime: json["booking_time"] == null ? null : json["booking_time"],
        price: json["price"] == null ? null : json["price"],
        labName: json["lab_name"] == null ? null : json["lab_name"],
        labImage: json["lab_image"] == null ? null : json["lab_image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "order_status": orderStatus == null ? null : orderStatus,
        "custom_order_id": customOrderId == null ? null : customOrderId,
        "booking_date": bookingDate == null ? null : bookingDate,
        "booking_time": bookingTime == null ? null : bookingTime,
        "price": price == null ? null : price,
        "lab_name": labName == null ? null : labName,
        "lab_image": labImage == null ? null : labImage,
      };
}
