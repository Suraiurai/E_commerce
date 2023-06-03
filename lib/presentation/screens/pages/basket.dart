import 'package:e_commerce_flutter/domain/models/product.dart';
import 'package:e_commerce_flutter/presentation/components/widget.dart';
import 'package:e_commerce_flutter/presentation/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

// ignore: must_be_immutable
class BasketPage extends StatefulWidget {
  BasketPage({super.key});
  @override
  State<BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  var box = Hive.box('products');

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (box.isEmpty)
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/basket.png'),
                  TextFrave(
                    text: 'Basket is Empty',
                    color: ColorsUI.primaryColorFrave,
                  )
                ],
              ),
            ),
          if (box.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextFrave(
                    text: 'Basket',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: ListView.builder(
                      itemCount: box.length,
                      itemBuilder: (context, index) {
                       final product = box.getAt(index);
                     debugPrint(product.brand);
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 8),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.shade200,
                                      blurRadius: 10,
                                      spreadRadius: 10)
                                ]),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 16),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.network(product.images[0],
                                          width: 100,
                                          height: 100,
                                          fit: BoxFit.fill)),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                            width: 200,
                                            child: TextFrave(
                                                text: product.title.toString(),
                                                maxLines: 2)),
                                        InkWell(
                                          onTap: () {
                                            box.deleteAt(index);
                                            setState(() {});
                                          },
                                          child: Icon(
                                            Icons.delete_outline,
                                            color: Colors.grey.shade700,
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              product.price.toString() +
                                                  ' \$',
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  decoration: TextDecoration
                                                      .lineThrough),
                                            ),
                                            TextFrave(
                                                text: product.discountPercentage
                                                        .toString() +
                                                    ' \$'),
                                          ],
                                        ),
                                        SizedBox(width: 50),
                                        BtnFrave(
                                            text: 'btn', width: 100, height: 30)
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: 5,
                )
              ],
            )
        ],
      )),
    );
  }
}
