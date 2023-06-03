// To parse this JSON data, do
//
//     final jsonOneProduct = jsonOneProductFromJson(jsonString);

import 'dart:convert';

JsonOneProduct jsonOneProductFromJson(String str) => JsonOneProduct.fromJson(json.decode(str));

String jsonOneProductToJson(JsonOneProduct data) => json.encode(data.toJson());

class JsonOneProduct {
    int id;
    String title;
    String description;
    int price;
    double discountPercentage;
    double rating;
    int stock;
    String brand;
    String category;
    String thumbnail;
    List<String> images;

    JsonOneProduct({
        required this.id,
        required this.title,
        required this.description,
        required this.price,
        required this.discountPercentage,
        required this.rating,
        required this.stock,
        required this.brand,
        required this.category,
        required this.thumbnail,
        required this.images,
    });

    factory JsonOneProduct.fromJson(Map<String, dynamic> json) => JsonOneProduct(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        price: json["price"],
        discountPercentage: json["discountPercentage"]?.toDouble(),
        rating: json["rating"]?.toDouble(),
        stock: json["stock"],
        brand: json["brand"],
        category: json["category"],
        thumbnail: json["thumbnail"],
        images: List<String>.from(json["images"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "price": price,
        "discountPercentage": discountPercentage,
        "rating": rating,
        "stock": stock,
        "brand": brand,
        "category": category,
        "thumbnail": thumbnail,
        "images": List<dynamic>.from(images.map((x) => x)),
    };
}
