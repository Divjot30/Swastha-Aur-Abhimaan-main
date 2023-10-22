import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  Color fillColor;
  String title;
  Color textColor;
  Function onpressed;
  CustomButton(
      {Key? key,
      required this.fillColor,
      required this.onpressed,
      required this.textColor,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        onpressed;
      },
      child: Container(
        alignment: Alignment.center,
        width: size.width * 0.4,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: fillColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Text(
          title,
          style: TextStyle(
              color: textColor, fontSize: 18, fontFamily: 'LexendLight'),
        ),
      ),
    );
  }
}
