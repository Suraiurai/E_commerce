import 'package:flutter/material.dart';


class NavigatinProduct {
  final route;

  NavigatinProduct(this.route);
  navigation(var context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return route;
    }));
  }
}
