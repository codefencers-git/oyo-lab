// To parse this JSON data, do
//
//     final lAbTestDetailModel = lAbTestDetailModelFromJson(jsonString);

import 'dart:convert';

LAbTestDetailModel lAbTestDetailModelFromJson(String str) =>
    LAbTestDetailModel.fromJson(json.decode(str));

String lAbTestDetailModelToJson(LAbTestDetailModel data) =>
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
    this.category,
    this.testType,
    this.image,
    this.gallery,
    this.price,
    this.priceTxt,
    this.isDiscount,
    this.discountPrice,
    this.discountLabel,
    this.description,
    this.labList,
    this.reviews,
  });

  String? id;
  String? title;
  String? category;
  String? testType;
  String? image;
  List<Gallery>? gallery;
  String? price;
  String? priceTxt;
  String? isDiscount;
  String? discountPrice;
  String? discountLabel;
  String? description;
  List<RecommendedProduct>? labList;
  List<Review>? reviews;

  factory LAbTestDetailData.fromJson(Map<String, dynamic> json) =>
      LAbTestDetailData(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        category: json["category"] == null ? null : json["category"],
        testType: json["test_type"] == null ? null : json["test_type"],
        image: json["image"] == null ? null : json["image"],
        gallery: json["gallery"] == null
            ? null
            : List<Gallery>.from(
                json["gallery"].map((x) => Gallery.fromJson(x))),
        price: json["price"] == null ? null : json["price"],
        priceTxt: json["price_txt"] == null ? null : json["price_txt"],
        isDiscount: json["is_discount"] == null ? null : json["is_discount"],
        discountPrice:
            json["discount_price"] == null ? null : json["discount_price"],
        discountLabel:
            json["discount_label"] == null ? null : json["discount_label"],
        description: json["description"] == null ? null : json["description"],
        labList: json["lab_list"] == null
            ? null
            : List<RecommendedProduct>.from(
                json["lab_list"].map((x) => RecommendedProduct.fromJson(x))),
        reviews: json["reviews"] == null
            ? null
            : List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "category": category == null ? null : category,
        "test_type": testType == null ? null : testType,
        "image": image == null ? null : image,
        "gallery": gallery == null
            ? null
            : List<dynamic>.from(gallery!.map((x) => x.toJson())),
        "price": price == null ? null : price,
        "price_txt": priceTxt == null ? null : priceTxt,
        "is_discount": isDiscount == null ? null : isDiscount,
        "discount_price": discountPrice == null ? null : discountPrice,
        "discount_label": discountLabel == null ? null : discountLabel,
        "description": description == null ? null : description,
        "lab_list": labList == null
            ? null
            : List<dynamic>.from(labList!.map((x) => x.toJson())),
        "reviews": reviews == null
            ? null
            : List<dynamic>.from(reviews!.map((x) => x.toJson())),
      };
}

class Gallery {
  Gallery({
    this.image,
  });

  String? image;

  factory Gallery.fromJson(Map<String, dynamic> json) => Gallery(
        image: json["image"] == null ? null : json["image"],
      );

  Map<String, dynamic> toJson() => {
        "image": image == null ? null : image,
      };
}

class RecommendedProduct {
  RecommendedProduct({this.id, this.name, this.image, this.area});

  String? id;
  String? name;

  String? image;
  String? area;

  factory RecommendedProduct.fromJson(Map<String, dynamic> json) =>
      RecommendedProduct(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        image: json["image"] == null ? null : json["image"],
        area: json["area"] == null ? null : json["area"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "image": image == null ? null : image,
        "area": area == null ? null : area,
      };
}

class Review {
  Review({
    this.id,
    this.name,
    this.image,
    this.date,
    this.rating,
    this.review,
  });

  String? id;
  String? name;
  String? image;
  String? date;
  String? rating;
  String? review;

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        image: json["image"] == null ? null : json["image"],
        date: json["date"] == null ? null : json["date"],
        rating: json["rating"] == null ? null : json["rating"],
        review: json["review"] == null ? null : json["review"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "image": image == null ? null : image,
        "date": date == null ? null : date,
        "rating": rating == null ? null : rating,
        "review": review == null ? null : review,
      };
}
