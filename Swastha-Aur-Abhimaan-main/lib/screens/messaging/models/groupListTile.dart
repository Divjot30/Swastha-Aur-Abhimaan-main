import 'package:flutter/material.dart';

class GroupListTile extends StatelessWidget {
  final String groupName;

  const GroupListTile({
    Key? key,
    required this.groupName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        //nextScreen(context, page);
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
          groupName,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: size.width * 0.05,
            fontFamily: "Lexend",
          ),
        ),
      ),
    );
  }
}
