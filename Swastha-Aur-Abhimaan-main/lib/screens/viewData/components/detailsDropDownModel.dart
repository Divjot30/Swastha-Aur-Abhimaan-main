import 'package:flutter/material.dart';

class LeftText extends StatelessWidget {
  final String title;

  const LeftText({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(size.width * 0.012),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'Lexend',
          fontSize: size.width * 0.045,
          color: Colors.black,
        ),
      ),
    );
  }
}

class RightText extends StatelessWidget {
  final String title;

  const RightText({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
        padding: EdgeInsets.all(size.width * 0.012),
        child: Text(
          capitalizeString(title),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Lexend',
            fontSize: size.width * 0.04,
            color: Colors.blue,
          ),
        ));
  }
}

capitalizeString(String s) {
  String str = s;
  String newStr = "";
  for (int i = 0; i < str.length; i++) {
    if (i == 0) {
      newStr = newStr + str[i].toUpperCase();
    } else {
      newStr = newStr + str[i];
    }
  }
  return newStr;
}
