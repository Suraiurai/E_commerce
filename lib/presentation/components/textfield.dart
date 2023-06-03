part of './widget.dart';

class TextFormFrave extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final bool isPassword;
  final TextInputType keyboardType;
  final FormFieldValidator<String>? validator;
  final String? number;

  const TextFormFrave({
    Key? key,
    required this.controller,
    this.number,
    this.hintText,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: GoogleFonts.getFont('Roboto', fontSize: 17),
      obscureText: isPassword,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        prefixText: number,
        
        prefixStyle: TextStyle(color: Colors.grey.shade500),
        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15.0),
        filled: true,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent)),
        fillColor: Colors.grey.shade200,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: Color(0xffF5F5F5))),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: Color(0xffF5F5F5))),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey.shade500)
      ),
      validator: validator,
    );
  }
}
