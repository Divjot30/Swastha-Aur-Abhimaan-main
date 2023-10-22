import 'package:flutter/material.dart';

class VisibleOption extends StatelessWidget {
  final bool click;
  final String label;
  final List toDisplay;
  const VisibleOption(
      {Key? key,
      required this.click,
      required this.label,
      required this.toDisplay})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Visibility(
      visible: click,
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontFamily: 'Lexend',
              fontSize: size.width * 0.055,
              color: Colors.black,
            ),
          ),
          // SizedBox(height: size.height * 0.02),
          SingleChildScrollView(
            child: SizedBox(
              height: size.height * 0.8,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: toDisplay.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        toDisplay[index]['head'],
                        style: TextStyle(
                          fontFamily: 'Lexend',
                          fontSize: size.width * 0.055,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: size.height * 0.01),
                      Text(
                        toDisplay[index]['body'],
                        style: TextStyle(
                          fontFamily: 'Lexend',
                          fontSize: size.width * 0.05,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: size.height * 0.02),
                    ],
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
