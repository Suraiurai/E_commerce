import 'package:e_commerce_flutter/domain/blocs/fav_bloc/fav_product_bloc.dart';
import 'package:e_commerce_flutter/presentation/components/widget.dart';
import 'package:e_commerce_flutter/presentation/screens/widgets/export_widget.dart';
import 'package:e_commerce_flutter/presentation/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FavouritePage extends StatelessWidget {
  FavouritePage({super.key});
  var box = Hive.box('fav_product');
  @override
  Widget build(BuildContext context) {
    // box.clear();
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<FavProductBloc, FavProductChanged>(
          builder: (context, state) {
            if (box.isEmpty) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(child: Image.asset('assets/fav.png')),
                  TextFrave(
                    text: 'No Favourite!',
                    color: ColorsUI.primaryColorFrave,
                  )
                ],
              );
            } else {
              return state is FavListState
                  ? ListView(children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: GridView.builder(
                              shrinkWrap: true,
                              physics: ScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      childAspectRatio: 0.6,
                                      mainAxisSpacing: 15,
                                      crossAxisSpacing: 15,
                                      crossAxisCount: 2),
                              itemCount: state.favproducts.length,
                              itemBuilder: (context, index) {
                                debugPrint(
                                    state.favproducts[index].id.toString());
                                return ProductWidget(
                                    id: state.favproducts[index].id,
                                    product: state.favproducts[index]);
                              },
                            ),
                          ),
                        ],
                      ),
                    ])
                  : Container();
            }
          },
        ),
      ),
    );
  }
}
