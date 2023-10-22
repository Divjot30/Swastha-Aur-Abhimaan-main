import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UserCountModel extends StatelessWidget {
  String count;
  String label;
  UserCountModel({Key? key, required this.count, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme font = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(10),
      width: size.width * 0.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(17),
        border: Border.all(
          color: Colors.black,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              count,
              style: font.headlineLarge!.merge(const TextStyle(
                fontFamily: 'Lexend',
                color: Colors.black,
              )),
            ),
            Text(
              'Total $label',
              style: font.titleMedium!.merge(const TextStyle(
                fontFamily: 'Lexend',
                color: Colors.black,
              )),
            ),
          ],
        ),
      ),
    );
  }
}
