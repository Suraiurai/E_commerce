// ignore_for_file: must_be_immutable

import 'package:e_commerce_flutter/presentation/components/widget.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../domain/models/product.dart';

class ProductWidget extends StatelessWidget {
  ProductWidget({
    super.key,
    required this.product,
  });
  final Product product;
  var box = Hive.box('products');
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade200, blurRadius: 10, spreadRadius: 10)
          ],
          color: Colors.white),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                child: Image.network(
                  product.images.first,
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                  top: 5,
                  right: 5,
                  child: Icon(
                    Icons.favorite_border_outlined,
                    color: Colors.grey.shade800,
                  ))
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Container(
                  height: 40,
                  child: Text(
                    product.title,
                    maxLines: 2,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextFrave(
                      text: '${product.price} \$',
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                    Text(
                      product.discountPercentage.toString() + '\$',
                      style: TextStyle(decoration: TextDecoration.lineThrough),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Center(
                  child: InkWell(
                    onTap: () async {
                      await box.add(product);
                    },
                    child: BtnFrave(
                      text: 'Add to Box',
                      fontSize: 17,
                      width: 150,
                      height: 35,
                      radius: 8,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
