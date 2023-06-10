// To parse this JSON data, do
//
//     final jsonCategoryProduct = jsonCategoryProductFromJson(jsonString);

import 'dart:convert';

import 'package:e_commerce_flutter/domain/models/product.dart';

JsonCategoryProduct jsonCategoryProductFromJson(String str) => JsonCategoryProduct.fromJson(json.decode(str));

String jsonCategoryProductToJson(JsonCategoryProduct data) => json.encode(data.toJson());

class JsonCategoryProduct {
    List<Product> products;
    int total;
    int skip;
    int limit;

    JsonCategoryProduct({
        required this.products,
        required this.total,
        required this.skip,
        required this.limit,
    });

    factory JsonCategoryProduct.fromJson(Map<String, dynamic> json) => JsonCategoryProduct(
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
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
