import 'package:flutter/material.dart';


class NavigatinOneProduct {
  final route;

  NavigatinOneProduct(this.route);
  navigation(var context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return route;
    }));
  }
}
