import 'package:e_commerce_flutter/presentation/components/widget.dart';
import 'package:flutter/material.dart';

class Categories_Widiget extends StatelessWidget {
  const Categories_Widiget({
    super.key,
    required this.pic,
    required this.text,
  });

  final String pic;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                pic,
                width: 100,
                height: 200,
                fit: BoxFit.fill,
              ),
            ),
            Container(
                width: 100,
                height: 299,
                decoration: BoxDecoration(
                    color: Colors.grey.shade700.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(10))),
            Positioned(
                bottom: 8,
                left: 0,
                right: 0,
                child: SizedBox(
                  width: 80,
                  child: Center(
                    child: TextFrave(
                      text: text,
                      fontSize: 14,
                      overflow: TextOverflow.ellipsis,
                      color: Colors.white,
                    ),
                  ),
                ))
          ],
        ));
  }
}
