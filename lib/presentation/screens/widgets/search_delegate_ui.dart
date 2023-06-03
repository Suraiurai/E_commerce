import 'package:e_commerce_flutter/presentation/components/widget.dart';
import 'package:e_commerce_flutter/presentation/screens/pages/exportpage.dart';
import 'package:e_commerce_flutter/presentation/screens/widgets/navigator.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/blocs/search_dlegate/search_bloc.dart';

class MyWidget extends StatefulWidget {
  final keyy;
  MyWidget({super.key, required this.keyy});
  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
        bloc: context.read<SearchBloc>()..add(SearchTappedEvent(widget.keyy)),
        builder: (context, state) {
          if (state is SearchLoadingState) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is SearchLoadedState) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                      itemCount: state.jsonSearch.products.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            context.read<SearchBloc>().add(SearchTappedEvent(
                                state.jsonSearch.products[index].id
                                    .toString()));
                            NavigatinOneProduct(OneProductPage(id: state.jsonSearch.products[index].id)).navigation(context);
                           
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              leading: Image.network(
                                state.jsonSearch.products[index].images[0],
                                height: 120,
                                width: 100,
                                fit: BoxFit.fill,
                              ),
                              title:
                                  Text(state.jsonSearch.products[index].title),
                              subtitle: Row(children: [
                                TextFrave(
                                  text: state.jsonSearch.products[index].price
                                          .toString() +
                                      " \$",
                                ),
                                SizedBox(width: 10),
                              ]),
                            ),
                          ),
                        );
                      }),
                ),
              ],
            );
          }
          if (state is SearchErroeState) {
            return Text(state.error);
          }
          return Container();
        });
  }
}
