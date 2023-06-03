part of './widget.dart';

class BtnFrave extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final double border;
  final Color colorText;
  final Color backgroundColor;
  final double fontSize;
  final VoidCallback? onPressed;
  final FontWeight fontWeight;
  final bool isTitle;
  final double radius;
  final double blurradius;

  const BtnFrave(
      {Key? key,
      required this.text,
      required this.width,
      this.onPressed,
      this.height = 50,
      this.border = 8.0,
      this.colorText = Colors.white,
      this.fontSize = 19,
      this.backgroundColor = ColorsUI.primaryColorFrave,
      this.fontWeight = FontWeight.normal,
      this.isTitle = false,
      this.blurradius = 10,
      this.radius = 10.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height,
        width: width,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(radius),
              boxShadow: [BoxShadow(color:Colors.grey.shade300, blurRadius: blurradius)]
              ),
          child: Center(
            child: TextFrave(
              text: text,
              color: colorText,
              fontSize: fontSize,
              fontWeight: fontWeight,
              isTitle: isTitle,
            ),
          ),
        ));
  }
}
