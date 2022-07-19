// To parse this JSON data, do
//
//     final dashboardModel = dashboardModelFromJson(jsonString);

import 'dart:convert';

DashboardModel dashboardModelFromJson(String str) =>
    DashboardModel.fromJson(json.decode(str));

String dashboardModelToJson(DashboardModel data) => json.encode(data.toJson());

class DashboardModel {
  DashboardModel({
    this.success,
    this.status,
    this.message,
    this.data,
  });

  String? success;
  String? status;
  String? message;
  DashboardData? data;

  factory DashboardModel.fromJson(Map<String, dynamic> json) => DashboardModel(
        success: json["success"] == null ? null : json["success"],
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        data:
            json["data"] == null ? null : DashboardData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "data": data == null ? null : data!.toJson(),
      };
}

class DashboardData {
  DashboardData({
    this.slider,
    this.tests,
  });

  List<Slider>? slider;
  List<Test>? tests;

  factory DashboardData.fromJson(Map<String, dynamic> json) => DashboardData(
        slider: json["slider"] == null
            ? null
            : List<Slider>.from(json["slider"].map((x) => Slider.fromJson(x))),
        tests: json["tests"] == null
            ? null
            : List<Test>.from(json["tests"].map((x) => Test.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "slider": slider == null
            ? null
            : List<dynamic>.from(slider!.map((x) => x.toJson())),
        "tests": tests == null
            ? null
            : List<dynamic>.from(tests!.map((x) => x.toJson())),
      };
}

class Slider {
  Slider({
    this.id,
    this.title,
    this.tagline,
    this.image,
    this.isClickable,
    this.redirectTo,
    this.buttonText,
    this.description,
  });

  String? id;
  String? title;
  String? tagline;
  String? image;
  String? isClickable;
  String? redirectTo;
  String? buttonText;
  String? description;

  factory Slider.fromJson(Map<String, dynamic> json) => Slider(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        tagline: json["tagline"] == null ? null : json["tagline"],
        image: json["image"] == null ? null : json["image"],
        isClickable: json["is_clickable"] == null ? null : json["is_clickable"],
        redirectTo: json["redirect_to"] == null ? null : json["redirect_to"],
        buttonText: json["button_text"] == null ? null : json["button_text"],
        description: json["description"] == null ? null : json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "tagline": tagline == null ? null : tagline,
        "image": image == null ? null : image,
        "is_clickable": isClickable == null ? null : isClickable,
        "redirect_to": redirectTo == null ? null : redirectTo,
        "button_text": buttonText == null ? null : buttonText,
        "description": description == null ? null : description,
      };
}

class Test {
  Test({
    this.id,
    this.title,
    this.image,
    this.ownerId,
    this.countInCart,
    this.quantity,
    this.price,
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
  String? price;
  String? priceTxt;
  String? description;
  String? status;

  factory Test.fromJson(Map<String, dynamic> json) => Test(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        image: json["image"] == null ? null : json["image"],
        ownerId: json["owner_id"] == null ? null : json["owner_id"],
        countInCart:
            json["count_in_cart"] == null ? null : json["count_in_cart"],
        quantity: json["quantity"] == null ? null : json["quantity"],
        price: json["price"] == null ? null : json["price"],
        priceTxt: json["price_txt"] == null ? null : json["price_txt"],
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
        "description": description == null ? null : description,
        "status": status == null ? null : status,
      };
}
