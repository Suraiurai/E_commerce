import 'package:e_commerce_flutter/domain/models/product.dart';
import 'package:e_commerce_flutter/domain/models/repository.dart';
import 'package:e_commerce_flutter/presentation/screens/pages/exportpage.dart';
import 'package:flutter/material.dart';
import '../../components/shimmer.dart';
import '../../components/widget.dart';
import '../widgets/export_widget.dart';

class FirstPage extends StatelessWidget {
  FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Center(
                  child: InkWell(
                      onTap: () {
                        showSearch(context: context, delegate: Search());
                      },
                      child: SearchWidget())),
              SizedBox(height: 18),
              CardCarousel(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    TextFrave(
                        text: 'Categories',
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                    InkWell(
                      onTap: () {
                         Navigator.push(context, MaterialPageRoute(builder: (_){
                          return CategoryPage();
                        }));
                      },
                      child: BtnFrave(
                        text: 'See all',
                        width: 80,
                        height: 30,
                        fontSize: 17,
                        backgroundColor: Colors.white,
                        colorText: Colors.black,
                        
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              FutureBuilder(
                  future: GetList().getList(),
                  builder: (context, snap) {
                    return snap.hasData
                        ? SizedBox(
                            height: 140,
                            child: ListView.builder(
                                itemCount: 5,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return FutureBuilder(
                                      future: GetCategoryProduct()
                                          .getactioninfo(snap.data![index]),
                                      builder: (_, snapshot) {
                                        if (snapshot.hasData) {
                                          return Categories_Widiget(
                                              pic: snapshot
                                                  .data![index].images[0],
                                              text: snap.data![index]);
                                        }
                                        return Container();
                                      });
                                }),
                          )
                        : SizedBox(
                            height: 140,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 10,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ShimmerFrave(heght: 200, width: 100),
                                  );
                                }),
                          );
                  }),
              SizedBox(height: 10),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    TextFrave(
                        text: 'Products',
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                    BtnFrave(
                      text: 'See all',
                      width: 80,
                      height: 30,
                      fontSize: 17,
                      backgroundColor: Colors.white,
                      colorText: Colors.black,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              FutureBuilder(
                  future: GetProduct().getactioninfo(),
                  builder: (context, snapshot) {
                    return snapshot.hasData
                        ? Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 5.4,
                                child: GridView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            childAspectRatio: 0.6,
                                            mainAxisSpacing: 15,
                                            crossAxisSpacing: 15),
                                    itemCount: snapshot.data!.length,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          NavigatinProduct(OneProductPage(
                                                  id: snapshot.data![index].id))
                                              .navigation(context);
                                        },
                                        child: ProductWidget(
                                          product: snapshot.data![index],
                                          id: snapshot.data![index].id,
                                        ),
                                      );
                                    })),
                          )
                        : SizedBox(
                            height: 300,
                            child: GridView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        childAspectRatio: 0.6,
                                        mainAxisSpacing: 15,
                                        crossAxisSpacing: 15,
                                        crossAxisCount: 2),
                                itemCount: 20,
                                itemBuilder: (context, index) {
                                  return ShimmerFrave(heght: 160, width: 100);
                                }),
                          );
                  })
            ],
          ),
        ],
      ),
    );
  }
}
