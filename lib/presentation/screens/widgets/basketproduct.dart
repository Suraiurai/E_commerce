import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/blocs/addtobox/addtobox_bloc.dart';
import '../../components/widget.dart';
import '../../themes/colors.dart';

class BasketProduct extends StatelessWidget {
  const BasketProduct({super.key, required this.state});
 final state;
  @override
  Widget build(BuildContext context) {
    return Column(
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
                            itemCount: state.listinit.length,
                            itemBuilder: (context, index) {
                              var product = state.listinit;
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
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: Image.network(
                                                product[index].images[0],
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
                                                      text: product[index].title .toString(),
                                                      maxLines: 2)),
                                              InkWell(
                                                onTap: () {
                                                  context.read<AddtoboxBloc>()
                                                    ..add(OnRemoveEvent(
                                                      product[index].id,
                                                    ));
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                          const SnackBar(
                                                              backgroundColor:
                                                                  ColorsUI.primaryColorFrave,
                                                              duration:
                                                                  Duration(seconds:1),
                                                              content: Center(
                                                                child:
                                                                    TextFrave(
                                                                  text:
                                                                      'Deleted from basket!',
                                                                  fontWeight:FontWeight.bold,
                                                                  fontSize: 14,
                                                                  color: Colors .white,
                                                                ),
                                                              )));
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
                                                     product[index].price.toString() +   ' \$',
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        decoration:
                                                            TextDecoration
                                                                .lineThrough),
                                                  ),
                                                  TextFrave(
                                                      text: (product[index].price - product[index].discountPercentage).toString() + ' \$'),
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
                            child: Center(child: TextFrave(text: state.listinit[0].price.toString())),
                          ),
                          BtnFrave(
                              text: 'Sargydy tayyarlamak',
                              width: MediaQuery.of(context).size.width / 2,
                              height: 40,
                              radius: 0)
                        ],
                      )
                    ],
                  );
  }
}