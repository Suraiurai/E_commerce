import 'dart:math';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:e_commerce_flutter/domain/models/repository.dart';
import 'package:e_commerce_flutter/presentation/components/shimmer.dart';
import 'package:e_commerce_flutter/presentation/components/widget.dart';
import 'package:e_commerce_flutter/presentation/screens/widgets/product_widget.dart';
import 'package:e_commerce_flutter/presentation/themes/colors.dart';
import 'package:flutter/material.dart';

import '../widgets/navigator.dart';

class OneProductPage extends StatelessWidget {
  const OneProductPage({super.key, required this.id});
final int id;
  @override
  Widget build(BuildContext context) {
    List randomnumbers = [];
    for (int i = 0; i <= 8; i++) {
      int random = Random().nextInt(29);
      randomnumbers.add(random);
    }
    return Scaffold(
        body: SafeArea(
            child: ListView(shrinkWrap: true, children: [
      FutureBuilder(
        future: GetOneProduct().getoneproduct(id),
        builder: (conetx, snap){
         return snap.hasData ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Row(
                          children: [
                            InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(Icons.arrow_back_ios)),
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.3),
                            Text(
                             snap.data!.title,
                              style: const TextStyle(fontSize: 18),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      CarouselSlider.builder(
                          itemCount: snap.data!.images.length,
                          itemBuilder: (contex, index, real) {
                            return Image.network(
                              snap.data!.images[index],
                              fit: BoxFit.fill,
                            );
                          },
                          options: CarouselOptions(
                            viewportFraction: 1,
                            aspectRatio: 1.3,
                          )),
                          SizedBox(height: 5),
                          Center(
                          child: DotsIndicator(
                            dotsCount: snap.data!.images.length,
                            position: 0.0,
                            decorator: DotsDecorator(
                              activeColor: ColorsUI.primaryColorFrave,
                              size: const Size.square(8.0),
                              activeSize: const Size(15.0, 9.0),
                              activeShape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                            ),
                          ),
                        ),
                      SizedBox(height: 15),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                          ),
                          child: TextFrave(
                            text: snap.data!.brand,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          )),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 20),
                        child: Text(snap.data!.description),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextFrave(
                          text: 'Recommendations',
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 20),
                      FutureBuilder(
                        future: GetProduct().getactioninfo(),
                        builder: (context, snapshot){
                        return snapshot.hasData ?  Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      child: SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              1.1,
                                          child: GridView.builder(
                                              shrinkWrap: true,
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 2,
                                                      childAspectRatio: 0.6,
                                                      mainAxisSpacing: 15,
                                                      crossAxisSpacing: 15),
                                              itemCount: 6,
                                              itemBuilder: (context, index) {
                                                return InkWell(
                                                  onTap: () {
                                                    
                                                    NavigatinOneProduct(OneProductPage(id: snapshot.data![randomnumbers[index]].id))
                                                        .navigation(context);
                                                  },
                                                  child: ProductWidget(

                                                    product:  snapshot.data![randomnumbers[index]]
                                                      // pic: snapshot.data!.products[randomnumbers[index]].images[0],
                                                      // text: snapshot.data!.products[randomnumbers[index]].title,
                                                      // oldprice: snapshot.data!.products[randomnumbers[index]].price,
                                                      // discountprice: (snapshot.data!.products[randomnumbers[index]].price -snapshot.data!.products[randomnumbers[index]].discountPercentage).toStringAsFixed(2),
                                                      ),
                                                );
                                              })),
                                    ) : ShimmerFrave();
                      })
                    ],
                  ) : ShimmerFrave();
      })
    ])));
  }
}
