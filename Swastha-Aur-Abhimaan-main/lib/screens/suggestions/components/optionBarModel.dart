import 'package:flutter/material.dart';

class OptionBarModel extends StatelessWidget {
  final bool click;
  final String label;
  final Color fillColor;
  final Color borderColor;
  const OptionBarModel(
      {Key? key,
      required this.click,
      required this.label,
      required this.fillColor,
      required this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(
        left: size.width * 0.025,
        right: size.width * 0.025,
        top: size.height * 0.01,
        bottom: size.height * 0.01,
      ),
      // width: size.width * 0.25,
      height: size.height * 0.05,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: click ? borderColor : Colors.black,
          width: 1,
        ),
        color: click ? fillColor : Colors.white,
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            fontFamily: 'Lexend',
            fontSize: size.width * 0.04,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
