import 'package:flutter/material.dart';
import '../../components/widget.dart';
import '../../themes/colors.dart';

class Options extends StatelessWidget {
  const Options({
    super.key, required this.text,required this.icon,
  });
final String text;
final icon;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: ColorsUI.primaryColorFrave,
                ),
                SizedBox(width: 20),
                TextFrave(text: text)
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                )
              ],
            )
          ],
        ),
      ),
      Divider(
        indent: 15,
        endIndent: 15,
        thickness: 0.8,
      )
    ]);
  }
}
