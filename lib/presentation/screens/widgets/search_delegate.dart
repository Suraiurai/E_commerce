import 'package:e_commerce_flutter/presentation/screens/widgets/search_delegate_ui.dart';
import 'package:flutter/material.dart';

class Search extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      InkWell(
          onTap: () {
            query = '';
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.search_outlined),
          ))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back_ios));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return MyWidget(
      keyy: query,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return Container();
  }
}
