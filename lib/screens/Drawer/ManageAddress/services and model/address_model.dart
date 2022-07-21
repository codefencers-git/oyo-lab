// To parse this JSON data, do
//
//     final addressModel = addressModelFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators, unnecessary_null_comparison

import 'dart:convert';

AddressModel addressModelFromJson(String str) =>
    AddressModel.fromJson(json.decode(str));

String addressModelToJson(AddressModel data) => json.encode(data.toJson());

class AddressModel {
  AddressModel({
    this.success,
    this.status,
    this.message,
    this.data,
  });

  String? success;
  String? status;
  String? message;
  List<AddrressData>? data;

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        success: json["success"] == null ? null : json["success"],
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null
            ? null
            : List<AddrressData>.from(json["data"].map((x) => AddrressData.fromJson(x))),
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

class AddrressData {
  AddrressData({
    this.id,
    this.name,
    this.addressLine1,
    this.addressLine2,
    this.pincode,
  });

  String? id;
  String? name;
  String? addressLine1;
  String? addressLine2;
  String? pincode;

  factory AddrressData.fromJson(Map<String, dynamic> json) => AddrressData(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        addressLine1:
            json["address_line_1"] == null ? null : json["address_line_1"],
        addressLine2:
            json["address_line_2"] == null ? null : json["address_line_2"],
        pincode: json["pincode"] == null ? null : json["pincode"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "address_line_1": addressLine1 == null ? null : addressLine1,
        "address_line_2": addressLine2 == null ? null : addressLine2,
        "pincode": pincode == null ? null : pincode,
      };
}
