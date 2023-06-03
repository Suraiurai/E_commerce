import 'package:e_commerce_flutter/presentation/themes/colors.dart';
import 'package:flutter/material.dart';

import '../../components/widget.dart';

class SearchWidget extends StatelessWidget {
  SearchWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.9,
      height: 50,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: Colors.grey.shade300, blurRadius: 7, spreadRadius: 2)
      ], borderRadius: BorderRadius.circular(40), color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            TextFrave(text: 'search', color: Colors.grey,),
            CircleAvatar(
              backgroundColor: ColorsUI.primaryColorFrave,
              child: Icon(
                Icons.search,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
