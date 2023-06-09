import 'package:e_commerce_flutter/domain/models/repository.dart';
import 'package:e_commerce_flutter/presentation/components/shimmer.dart';
import 'package:e_commerce_flutter/presentation/components/widget.dart';
import 'package:flutter/material.dart';

import '../widgets/export_widget.dart';

class CategoryProductPage extends StatelessWidget {
  const CategoryProductPage({super.key, required this.category});
  final String category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextFrave(text: category, fontWeight: FontWeight.bold, fontSize: 20,),
            ),
            SizedBox(height: 10),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: FutureBuilder(
                    future: GetCategoryProduct().getactioninfo(category),
                    builder: (_, snapshot) {
                      if (snapshot.hasData) {
                        return GridView.builder(
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 0.6,
                                  mainAxisSpacing: 15,
                                  crossAxisSpacing: 15,
                                  crossAxisCount: 2),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return ProductWidget(
                                id: snapshot.data![index].id,
                                product: snapshot.data![index]);
                          },
                        );
                      } else {
                        return ShimmerFrave(
                            heght: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width);
                      }
                    })),
          ],
        ),
      ])),
    );
  }
}
