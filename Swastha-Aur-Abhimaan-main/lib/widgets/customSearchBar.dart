import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final Color textColor;
  final Color backgroundColor;
  final String label;
  final Function searchFunction;
  const CustomSearchBar(
      {Key? key,
      required this.textColor,
      required this.backgroundColor,
      required this.label,
      required this.searchFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController textController = TextEditingController();
    Size size = MediaQuery.of(context).size;
    return Container(
        padding:
            EdgeInsets.only(left: size.width * 0.05, right: size.width * 0.05),
        decoration: BoxDecoration(
          color: backgroundColor,
        ),
        child: Row(
          children: [
            TextField(
              controller: textController,
              style: TextStyle(
                  color: textColor,
                  fontFamily: "Lexend",
                  fontSize: size.width * 0.05),
              decoration: InputDecoration(
                hintText: label,
                hintStyle: TextStyle(
                    color: textColor.withOpacity(0.7),
                    fontFamily: "Lexend",
                    fontSize: size.width * 0.05),
                border: InputBorder.none,
              ),
              autocorrect: true,
            ),
            IconButton(
              onPressed: () {
                searchFunction;
              },
              icon: Icon(
                Icons.search,
                size: size.width * 0.06,
                color: textColor,
              ),
              hoverColor: backgroundColor.withOpacity(0.5),
            ),
          ],
        ));
  }
}
