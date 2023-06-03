import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';


class ShimmerFrave extends StatelessWidget{

  const ShimmerFrave({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context){
    
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade200,
      highlightColor: const Color(0xFFF7F7F7),
      child: Container(
        height: 200,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.grey[200]
        ),
      ),
    );
  }
}