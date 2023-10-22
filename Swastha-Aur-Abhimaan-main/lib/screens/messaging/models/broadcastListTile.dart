import 'package:flutter/material.dart';
import 'package:swastha_aur_swabhimaan/constants/constant.dart';

class BroadcastListTile extends StatelessWidget {
  final Widget page;
  final String title;
  final String subtitle;
  const BroadcastListTile({
    Key? key,
    required this.page,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        nextScreen(context, page);
      },
      child: ListTile(
        leading: const CircleAvatar(
          radius: 25,
          backgroundColor: Color.fromARGB(255, 99, 96, 96),
          child: Icon(
            Icons.person,
            color: Colors.white,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: size.width * 0.05,
            fontFamily: "Lexend",
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: size.width * 0.04,
            fontFamily: "Lexend",
          ),
        ),
      ),
    );
  }
}
