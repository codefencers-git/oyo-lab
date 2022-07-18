// To parse this JSON data, do
//
//     final LAbTestDetailModel = LAbTestDetailModelFromJson(jsonString);

import 'dart:convert';

LAbTestDetailModel LAbTestDetailModelFromJson(String str) =>
    LAbTestDetailModel.fromJson(json.decode(str));

String LAbTestDetailModelToJson(LAbTestDetailModel data) =>
    json.encode(data.toJson());

class LAbTestDetailModel {
  LAbTestDetailModel({
    this.success,
    this.status,
    this.message,
    this.data,
  });

  String? success;
  String? status;
  String? message;
  LAbTestDetailData? data;

  factory LAbTestDetailModel.fromJson(Map<String, dynamic> json) =>
      LAbTestDetailModel(
        success: json["success"] == null ? null : json["success"],
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null
            ? null
            : LAbTestDetailData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "data": data == null ? null : data!.toJson(),
      };
}

class LAbTestDetailData {
  LAbTestDetailData({
    this.id,
    this.title,
    this.image,
    this.ownerId,
    this.countInCart,
    this.quantity,
    this.price,
    this.priceTxt,
    this.isDiscount,
    this.discountPrice,
    this.discountLabel,
    this.description,
    this.status,
    this.reviews,
    this.recommendedProduct,
  });

  String? id;
  String? title;
  String? image;
  String? ownerId;
  String? countInCart;
  String? quantity;
  String? price;
  String? priceTxt;
  String? isDiscount;
  String? discountPrice;
  String? discountLabel;
  String? description;
  String? status;
  dynamic reviews;
  List<RecommendedProduct>? recommendedProduct;

  factory LAbTestDetailData.fromJson(Map<String, dynamic> json) =>
      LAbTestDetailData(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        image: json["image"] == null ? null : json["image"],
        ownerId: json["owner_id"] == null ? null : json["owner_id"],
        countInCart:
            json["count_in_cart"] == null ? null : json["count_in_cart"],
        quantity: json["quantity"] == null ? null : json["quantity"],
        price: json["price"] == null ? null : json["price"],
        priceTxt: json["price_txt"] == null ? null : json["price_txt"],
        isDiscount: json["is_discount"] == null ? null : json["is_discount"],
        discountPrice:
            json["discount_price"] == null ? null : json["discount_price"],
        discountLabel:
            json["discount_label"] == null ? null : json["discount_label"],
        description: json["description"] == null ? null : json["description"],
        status: json["status"] == null ? null : json["status"],
        reviews: json["reviews"],
        recommendedProduct: json["recommended_product"] == null
            ? null
            : List<RecommendedProduct>.from(json["recommended_product"]
                .map((x) => RecommendedProduct.fromJson(x))),
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
        "is_discount": isDiscount == null ? null : isDiscount,
        "discount_price": discountPrice == null ? null : discountPrice,
        "discount_label": discountLabel == null ? null : discountLabel,
        "description": description == null ? null : description,
        "status": status == null ? null : status,
        "reviews": reviews,
        "recommended_product": recommendedProduct == null
            ? null
            : List<dynamic>.from(recommendedProduct!.map((x) => x.toJson())),
      };
}

class RecommendedProduct {
  RecommendedProduct({
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

  factory RecommendedProduct.fromJson(Map<String, dynamic> json) =>
      RecommendedProduct(
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
