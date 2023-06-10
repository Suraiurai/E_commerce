import 'dart:convert';
import 'package:e_commerce_flutter/domain/models/json/json_search.dart';
import 'package:e_commerce_flutter/domain/models/product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'json/export_json.dart';

var url = 'https://dummyjson.com/products';

class GetProduct {
  Future<List<Product>> getactioninfo() async {
    final res = await http.get(Uri.parse(url));
    var deco = jsonDecode(res.body);
    List<Product> products = [];
    final jsonpPoducts = deco["products"];
    for (var json in jsonpPoducts) {
      products.add(Product.fromJson(json));
    }
    return products;
  }
}

class GetPSearch {
  Future<JsonSearch> getsearch(String product) async {
    late JsonSearch jsonaction;
    final res = await http
        .get(Uri.parse('https://dummyjson.com/products/search?q=${product}'));
    debugPrint(res.body);
    var deco = jsonDecode(res.body);
    jsonaction = JsonSearch.fromJson(deco);
    return jsonaction;
  }
}

class GetList {
  Future<List<dynamic>> getList() async {
    final response =
        await http.get(Uri.parse('https://dummyjson.com/products/categories'));
    debugPrint(response.body);

    final deco = jsonDecode(response.body);

    return deco;
  }
}

class GetOneProduct {
  Future<JsonOneProduct> getoneproduct(int id) async {
    late JsonOneProduct jsonaction;
    final res =
        await http.get(Uri.parse('https://dummyjson.com/products/${id}'));
    debugPrint(res.body);
    var deco = jsonDecode(res.body);
    jsonaction = JsonOneProduct.fromJson(deco);
    return jsonaction;
  }
}



class GetCategoryProduct {
  Future<List<Product>> getactioninfo(String category) async {
    final res = await http.get(Uri.parse('https://dummyjson.com/products/category/$category'));
    var deco = jsonDecode(res.body);
    List<Product> products = [];
    final jsonpPoducts = deco["products"];
    for (var json in jsonpPoducts) {
      products.add(Product.fromJson(json));
    }
    return products;
  }
}
