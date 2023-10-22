import 'package:flutter/material.dart';
import 'package:swastha_aur_swabhimaan/constants/constant.dart';
import 'package:swastha_aur_swabhimaan/widgets/userActionsPanel.dart';

// ignore: must_be_immutable
class UserListModel extends StatelessWidget {
  String name;
  String village;
  String id;
  String adminName;
  UserListModel(
      {Key? key,
      required this.adminName,
      required this.name,
      required this.village,
      required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: size.height * 0.01),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        child: ListTile(
          leading: const CircleAvatar(
            radius: 25,
            backgroundColor: Color.fromARGB(255, 157, 135, 149),
            child: Icon(
              Icons.person,
              color: Colors.white,
            ),
          ),
          title: Text(
            capitaliseString(name),
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontFamily: "Lexend",
                fontSize: size.width * 0.05),
          ),
          subtitle: Text(
            capitaliseString(village),
            style: TextStyle(
                color: Colors.black.withOpacity(0.7),
                fontWeight: FontWeight.w500,
                fontFamily: "Lexend",
                fontSize: size.width * 0.04),
          ),
          trailing: IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => UserActionsPanel(
                  adminName: adminName,
                  name: name,
                  village: village,
                  id: id,
                ),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(40),
                  ),
                ),
                enableDrag: true,
              );
            },
            icon: Icon(
              Icons.keyboard_arrow_down,
              size: size.width * 0.06,
              color: const Color.fromARGB(255, 157, 135, 149),
            ),
          ),
        ),
      ),
    );
  }
}
