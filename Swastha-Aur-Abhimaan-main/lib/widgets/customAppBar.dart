import 'package:flutter/material.dart';
import 'package:swastha_aur_swabhimaan/constants/constant.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final Color barColor;
  final Color tiColor;
  const CustomAppBar(
      {Key? key,
      required this.barColor,
      required this.title,
      required this.tiColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: tiColor,
          size: size.width * 0.05,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Text(
        capitaliseString(title),
        style: TextStyle(
          color: tiColor,
          fontFamily: 'Lexend',
          fontSize: size.width * 0.055,
        ),
      ),
      backgroundColor: barColor,
    );
  }
}
