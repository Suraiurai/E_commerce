import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';


class ShimmerFrave extends StatelessWidget{

  const ShimmerFrave({Key? key, required this.heght, required this.width}): super(key: key);
  final double heght;
  final double width;
  @override
  Widget build(BuildContext context){
    
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade200,
      highlightColor:  Colors.white,
      child: Container(
        height: heght,
        width: width,
        decoration: BoxDecoration(
          color: Colors.grey[200]
        ),
      ),
    );
  }
}