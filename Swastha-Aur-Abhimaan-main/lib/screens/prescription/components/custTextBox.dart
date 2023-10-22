import 'package:flutter/material.dart';

class CusTextBox extends StatelessWidget {
  final String label;
  final FontWeight fontWeight;
  final double fontSize;
  const CusTextBox(
      {Key? key,
      required this.label,
      required this.fontWeight,
      required this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Text(
      label,
      style: TextStyle(
        fontSize: size.width * fontSize,
        fontFamily: "Lexend",
        color: Colors.black,
        fontWeight: fontWeight,
      ),
    );
  }
}
