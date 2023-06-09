import 'package:e_commerce_flutter/domain/models/repository.dart';
import 'package:e_commerce_flutter/presentation/components/shimmer.dart';
import 'package:e_commerce_flutter/presentation/components/widget.dart';
import 'package:e_commerce_flutter/presentation/screens/pages/categoryproducts.dart';
import 'package:e_commerce_flutter/presentation/themes/colors.dart';
import 'package:flutter/material.dart';

import '../widgets/export_widget.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              toolbarHeight: 20,
              bottom: TabBar(indicatorColor: ColorsUI.primaryColorFrave, tabs: [
                Tab(
                  child: TextFrave(text: 'Categories'),
                ),
                Tab(
                  child: TextFrave(text: 'Brands'),
                )
              ]),
            ),
            body: FutureBuilder(
                future: GetList().getList(),
                builder: (context, snap) {
                  return snap.hasData
                      ? TabBarView(
                          children: [
                            ListView.builder(
                                itemCount: snap.data!.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                       NavigatinProduct(CategoryProductPage(
                                                  category: snap.data![index],))
                                              .navigation(context);
                                    },
                                    child: ListTile(
                                      title: Text(snap.data![index]),
                                    ),
                                  );
                                }),
                            Container()
                          ],
                        )
                      : ListView.builder(
                          itemCount: 20,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: ShimmerFrave(
                                heght: 50,
                                width: MediaQuery.of(context).size.width,
                              ),
                            );
                          });
                })));
  }
}
