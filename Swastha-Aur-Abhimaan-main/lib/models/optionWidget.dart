import 'package:flutter/material.dart';

// ignore: must_be_immutable
class OptionWidget extends StatelessWidget {
  int leftRad;
  int rightRad;
  int topRad;
  int bottomRad;
  String image;
  double dim;
  OptionWidget(
      {Key? key,
      required this.image,
      required this.bottomRad,
      required this.leftRad,
      required this.rightRad,
      required this.dim,
      required this.topRad})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * dim,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(topRad.toDouble()),
          topRight: Radius.circular(rightRad.toDouble()),
          bottomLeft: Radius.circular(leftRad.toDouble()),
          bottomRight: Radius.circular(bottomRad.toDouble()),
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(
              0.0,
              3.0,
            ),
            blurRadius: 8.0,
            // spreadRadius: 2.0,
          ), //BoxShadow
          BoxShadow(
            color: Colors.white,
            offset: Offset(0.0, 0.0),
            blurRadius: 0.0,
            spreadRadius: 0.5,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(topRad.toDouble()),
          topRight: Radius.circular(rightRad.toDouble()),
          bottomLeft: Radius.circular(leftRad.toDouble()),
          bottomRight: Radius.circular(bottomRad.toDouble()),
        ),
        child: Image.asset(image),
      ),
    );
  }
}
