import 'package:e_commerce_flutter/domain/blocs/addtobox/addtobox_bloc.dart';
import 'package:e_commerce_flutter/presentation/components/widget.dart';
import 'package:e_commerce_flutter/presentation/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../widgets/export_widget.dart';

// ignore: must_be_immutable
class BasketPage extends StatelessWidget {
  BasketPage({super.key});

  var box = Hive.box('products');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<AddtoboxBloc, AddtoboxState>(
          builder: (context, state) {
            // box.clear();
            if (box.isEmpty) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(child: Image.asset('assets/basket.png')),
                  TextFrave(
                    text: 'Basket is Empty!',
                    color: ColorsUI.primaryColorFrave,
                  )
                ],
              );
            } else {
              return state is BoxInitial
                  ? BasketProduct(state: state)
                  : state is BoxAddedState
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
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
                                  itemCount: state.lst.length,
                                  itemBuilder: (context, index) {
                                    var p = state.lst;
                                   GetPrice().price(state.lst[index].price);
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 8),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey.shade200,
                                                  blurRadius: 10,
                                                  spreadRadius: 10)
                                            ]),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 16),
                                              child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  child: Image.network(
                                                      p[index].images[0],
                                                      width: 100,
                                                      height: 100,
                                                      fit: BoxFit.fill)),
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    SizedBox(
                                                        width: 200,
                                                        child: TextFrave(
                                                            text: p[index]
                                                                .title
                                                                .toString(),
                                                            maxLines: 2)),
                                                    InkWell(
                                                      onTap: () {
                                                        context
                                                            .read<
                                                                AddtoboxBloc>()
                                                            .add(OnRemoveEvent(
                                                              p[index].id,
                                                            ));
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                                const SnackBar(
                                                                    backgroundColor:
                                                                        ColorsUI.primaryColorFrave,
                                                                    duration: Duration(
                                                                        seconds:
                                                                            1),
                                                                    content:
                                                                        Center(
                                                                      child:
                                                                          TextFrave(
                                                                        text:  'Deleted from basket!',
                                                                        fontWeight: FontWeight.bold,
                                                                        fontSize: 14,
                                                                        color: Colors .white,
                                                                      ),
                                                                    )));
                                                      },
                                                      child: Icon(
                                                        Icons.delete_outline,
                                                        color: Colors
                                                            .grey.shade700,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(height: 10),
                                                Row(
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          p[index]
                                                                  .price
                                                                  .toString() +
                                                              ' \$',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.grey,
                                                              decoration:
                                                                  TextDecoration
                                                                      .lineThrough),
                                                        ),
                                                        TextFrave(
                                                            text: p[index]
                                                                    .discountPercentage
                                                                    .toString() +
                                                                ' \$'),
                                                      ],
                                                    ),
                                                    const SizedBox(width: 50),
                                                    BtnFrave(
                                                        text: 'btn',
                                                        width: 100,
                                                        height: 30)
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
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Center(
                                    child: Text(''),
                                      // child: TextFrave(
                                      //     text: GetPrice()
                                      //         .finalprice
                                      //         .toString())
                                              ),
                                ),
                                BtnFrave(
                                    text: 'Sargydy tayyarlamak',
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    height: 40,
                                    radius: 0)
                              ],
                            )
                          ],
                        )
                      : Container();
            }
          },
        ),
      ),
    );
  }
}

class GetPrice {
  var finalprice = 0;
  price(int price) {
    for (var i = 0; i <= price; i++) {
      finalprice += i;
      
    }
  }
}
