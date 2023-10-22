import 'package:flutter/material.dart';
import 'package:swastha_aur_swabhimaan/constants/constant.dart';

class NcertBooks extends StatelessWidget {
  const NcertBooks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: ncert.length,
        itemBuilder: (context, index) {
          return IconsAm(index: index);
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class IconsAm extends StatelessWidget {
  IconsAm({super.key, required this.index});
  int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.transparent,
          margin: const EdgeInsets.fromLTRB(8.0, 6.0, 8.0, 4.0),
          child: GestureDetector(
            onTap: () {
              nextScreen(context, ncert[index]['page']!);
            },
            child: CircleAvatar(
              backgroundImage: const AssetImage('Assets/images/bg.png'),
              radius: 30.0,
              child: Text(
                ncert[index]['class']!,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontFamily: 'Lexend',
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
        Text(
          // ignore: prefer_interpolation_to_compose_strings
          'Class\t' + ncert[index]['class']!,
          style: const TextStyle(
            fontSize: 12.0,
            fontFamily: 'Lexend',
          ),
        ),
      ],
    );
  }
}
