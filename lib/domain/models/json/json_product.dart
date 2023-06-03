// To parse this JSON data, do
//
//     final jsonProduct = jsonProductFromJson(jsonString);

import 'dart:convert';



import '../product.dart';

JsonProduct jsonProductFromJson(String str) =>
    JsonProduct.fromJson(json.decode(str));

String jsonProductToJson(JsonProduct data) => json.encode(data.toJson());


class JsonProduct {

  List<Product> products;

  int total;

  int skip;

  int limit;

  JsonProduct({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory JsonProduct.fromJson(Map<String, dynamic> json) => JsonProduct(
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
      );

  Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "total": total,
        "skip": skip,
        "limit": limit,
      };
}

