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
                  children: const [
                    TextFrave(
                        text: 'Categories',
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
              future: GetList().getList(),
              builder: (context, snap){
              return snap.hasData ? SizedBox(
                              height: 140,
                              child: ListView.builder(
                                  itemCount: 10,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Categories_Widiget(
                                        pic: 'assets/pic.jpg',
                                        text: snap.data![index]);
                                  }),
                            ) : ShimmerFrave();
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
                builder: (context, snapshot){
                   return snapshot.hasData ? Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
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
                                      itemCount:
                                         snapshot.data!.length,
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: (){
                                           
                                            NavigatinOneProduct(OneProductPage(id: snapshot.data![index].id)).navigation(context);
                                          },
                                          
                                          child: ProductWidget(
                                            product: snapshot.data![index],
                                              // pic: snapshot.data!.products[index].images[0],
                                              // text: snapshot.data!.products[index].title,
                                              // oldprice: snapshot.data!.products[index].price,
                                              // discountprice: (snapshot.data!.products[index].price -snapshot.data!.products[index].discountPercentage).toStringAsFixed(2),
                                              ),
                                        );
                                      })),
                            ) : ShimmerFrave();
              })
            ],
          ),
        ],
      ),
    );
  }
}
