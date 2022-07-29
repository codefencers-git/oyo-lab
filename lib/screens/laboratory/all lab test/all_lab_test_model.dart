// To parse this JSON data, do
//
//     final allLabTestModel = allLabTestModelFromJson(jsonString);

import 'dart:convert';

AllLabTestModel allLabTestModelFromJson(String str) =>
    AllLabTestModel.fromJson(json.decode(str));

String allLabTestModelToJson(AllLabTestModel data) =>
    json.encode(data.toJson());

class AllLabTestModel {
  AllLabTestModel({
    this.success,
    this.status,
    this.message,
    this.data,
  });

  String? success;
  String? status;
  String? message;
  LAbTestData? data;

  factory AllLabTestModel.fromJson(Map<String, dynamic> json) =>
      AllLabTestModel(
        success: json["success"] == null ? null : json["success"],
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : LAbTestData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "data": data == null ? null : data!.toJson(),
      };
}

class LAbTestData {
  LAbTestData({
    this.totalcount,
    this.data,
  });

  String? totalcount;
  List<LabTestProductData>? data;

  factory LAbTestData.fromJson(Map<String, dynamic> json) => LAbTestData(
        totalcount: json["totalcount"] == null ? null : json["totalcount"],
        data: json["data"] == null
            ? null
            : List<LabTestProductData>.from(
                json["data"].map((x) => LabTestProductData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "totalcount": totalcount == null ? null : totalcount,
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class LabTestProductData {
  LabTestProductData({
    this.id,
    this.title,
    this.image,
    this.ownerId,
    this.countInCart,
    this.quantity,
    this.price,
    this.testType,
    this.testCode,
    this.priceTxt,
    this.description,
    this.status,
  });

  String? id;
  String? title;
  String? image;
  String? ownerId;
  String? countInCart;
  String? quantity;
  String? testCode;
  String? testType;
  String? price;
  String? priceTxt;
  String? description;
  String? status;

  factory LabTestProductData.fromJson(Map<String, dynamic> json) =>
      LabTestProductData(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        image: json["image"] == null ? null : json["image"],
        ownerId: json["owner_id"] == null ? null : json["owner_id"],
        countInCart:
            json["count_in_cart"] == null ? null : json["count_in_cart"],
        quantity: json["quantity"] == null ? null : json["quantity"],
        price: json["price"] == null ? null : json["price"],
        priceTxt: json["price_txt"] == null ? null : json["price_txt"],
        testType: json["test_type"] == null ? null : json["test_type"],
        testCode: json["test_code"] == null ? null : json["test_code"],
        description: json["description"] == null ? null : json["description"],
        status: json["status"] == null ? null : json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "image": image == null ? null : image,
        "owner_id": ownerId == null ? null : ownerId,
        "count_in_cart": countInCart == null ? null : countInCart,
        "quantity": quantity == null ? null : quantity,
        "price": price == null ? null : price,
        "price_txt": priceTxt == null ? null : priceTxt,
        "test_type": testType == null ? null : testType,
        "test_code": testCode == null ? null : testCode,
        "description": description == null ? null : description,
        "status": status == null ? null : status,
      };
}
