// ignore_for_file: must_be_immutable
import 'package:e_commerce_flutter/domain/blocs/addtobox/addtobox_bloc.dart';
import 'package:e_commerce_flutter/domain/blocs/fav_bloc/fav_product_bloc.dart';
import 'package:e_commerce_flutter/domain/models/product.dart';
import 'package:e_commerce_flutter/presentation/components/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../themes/colors.dart';

class ProductWidget extends StatefulWidget {
  ProductWidget(
      {super.key,  required this.id, required this.product});

  final Product product;
  final int id;

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  var box = Hive.box('products');
  var box_fav = Hive.box('fav_product');
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
                  widget.product.images[0],
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill,
                ),
              ),
              BlocBuilder<FavProductBloc, FavProductChanged>(
                builder: (context, state) {
                  if(state is FavListState){
                    if (box_fav.containsKey('fav${widget.id}')) {
                     return Positioned(
                          top: 5,
                          right: 5,
                          child: InkWell(
                            onTap: () {
                              context.read<FavProductBloc>().add(OnDeleteEvent(widget.id));
                            },
                            child: Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ),
                          ));
                    }else{
                      return Positioned(
                          top: 5,
                          right: 5,
                          child: InkWell(
                            onTap: () {
                              context.read<FavProductBloc>().add(OnAddEvent(ida: widget.id, productadd: widget.product));
                            },
                            child: Icon(
                              Icons.favorite_border,
                              color: Colors.red,
                            ),
                          ));
                    }
                  }return SizedBox();
                },
              )
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
                    widget.product.title,
                    maxLines: 2,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextFrave(
                      text: '${widget.product.price} \$',
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                    Text(
                      widget.product.discountPercentage.toString() + '\$',
                      style: TextStyle(decoration: TextDecoration.lineThrough),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Center(
                  child: InkWell(
                    onTap: () async {
                      context.read<AddtoboxBloc>()
                        ..add(OnAddtoBoxEvent(
                            product: widget.product, id: widget.id));
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          backgroundColor: ColorsUI.primaryColorFrave,
                          duration: Duration(seconds: 1),
                          content: Center(
                            child: TextFrave(
                              text: 'Added to basket!',
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          )));
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



 // ScaffoldMessenger.of(context).clearSnackBars();
                            // if (isFav) {
                            //   await box.deleteAt(widget.id);
                            //   var snacbar = const SnackBar(
                            //       backgroundColor: ColorsUI.primaryColorFrave,
                            //       duration: Duration(seconds: 1),
                            //       content: Center(
                            //         child: TextFrave(
                            //           text: 'Deleted from Favourites!',
                            //           fontWeight: FontWeight.bold,
                            //           fontSize: 14,
                            //           color: Colors.white,
                            //         ),
                            //       ));
                            //   ScaffoldMessenger.of(context)
                            //       .showSnackBar(snacbar);
                            // } else {
                            //   await box.add(widget.product);
                            //   var snac =const SnackBar(
                            //       backgroundColor: ColorsUI.primaryColorFrave,
                            //       duration: Duration(seconds: 1),
                            //       content: Center(
                            //         child: TextFrave(
                            //           text: 'Added to Favourites!',
                            //           fontWeight: FontWeight.bold,
                            //           fontSize: 14,
                            //           color: Colors.white,
                            //         ),
                            //       ));
                            //   ScaffoldMessenger.of(context).showSnackBar(snac);
                              
                            // }